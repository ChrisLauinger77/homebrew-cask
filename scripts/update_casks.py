#!/usr/bin/env python3

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parents[1]
CONFIG_FILE = ROOT / "config" / "casks.json"


def request(url: str):
    headers = {
        "Accept": "application/vnd.github+json",
        "User-Agent": "homebrew-cask-updater",
        "X-GitHub-Api-Version": "2022-11-28",
    }
    token = os.environ.get("GITHUB_TOKEN")
    if token:
        headers["Authorization"] = f"Bearer {token}"
    return urlopen(Request(url, headers=headers), timeout=60)


def latest_release(repository: str) -> dict:
    with request(f"https://api.github.com/repos/{repository}/releases/latest") as response:
        return json.load(response)


def asset_sha256(url: str) -> str:
    digest = hashlib.sha256()
    with request(url) as response:
        while chunk := response.read(1024 * 1024):
            digest.update(chunk)
    return digest.hexdigest()


def update_cask(entry: dict) -> bool:
    release = latest_release(entry["repository"])
    tag = release.get("tag_name", "")
    if not tag.startswith("v") or len(tag) == 1:
        raise RuntimeError(f"Latest release for {entry['repository']} has invalid tag {tag!r}")

    pattern = re.compile(entry["asset_pattern"])
    assets = [asset for asset in release.get("assets", []) if pattern.fullmatch(asset["name"])]
    if len(assets) != 1:
        names = ", ".join(asset["name"] for asset in release.get("assets", []))
        raise RuntimeError(
            f"Expected one asset matching {entry['asset_pattern']!r} for {tag}; found "
            f"{len(assets)}. Available assets: {names}"
        )

    version = tag[1:]
    sha256 = asset_sha256(assets[0]["browser_download_url"])
    cask_path = ROOT / entry["cask_file"]
    content = cask_path.read_text()
    updated, version_count = re.subn(
        r'^(\s*version\s+)"[^"]*"', rf'\g<1>"{version}"', content, count=1, flags=re.MULTILINE
    )
    updated, sha_count = re.subn(
        r'^(\s*sha256\s+)"[^"]*"', rf'\g<1>"{sha256}"', updated, count=1, flags=re.MULTILINE
    )
    if version_count != 1 or sha_count != 1:
        raise RuntimeError(f"Could not update version and sha256 in {entry['cask_file']}")

    if updated == content:
        print(f"{entry['cask']}: already up to date at {version}")
        return False

    cask_path.write_text(updated)
    print(f"{entry['cask']}: updated to {version}")
    return True


def main() -> None:
    parser = argparse.ArgumentParser(description="Update Homebrew casks from GitHub releases")
    parser.add_argument("--cask", default="all", help="Cask name to update, or 'all'")
    args = parser.parse_args()

    entries = json.loads(CONFIG_FILE.read_text())
    known_casks = {entry["cask"] for entry in entries}
    if args.cask != "all" and args.cask not in known_casks:
        parser.error(f"unknown cask {args.cask!r}; choose from: {', '.join(sorted(known_casks))}")

    selected = entries if args.cask == "all" else [e for e in entries if e["cask"] == args.cask]
    for entry in selected:
        update_cask(entry)


if __name__ == "__main__":
    main()
