cask "code-convoy" do
  version "0.1.0"
  sha256 "1325b534a8829224098c0ac845cddfb40eb2d177a8c20b125838e56fea885836"

  url "https://github.com/ChrisLauinger77/code-convoy/releases/download/v#{version}/CodeConvoy-#{version}-macos-universal.dmg"
  name "CodeConvoy"
  desc "Run one task across multiple repositories with the coding agent of your choice"
  homepage "https://github.com/ChrisLauinger77/code-convoy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "CodeConvoy.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/CodeConvoy.app"]
  end

  caveats <<~EOS
    Git and your chosen coding-agent CLI must be installed separately.

    The Gatekeeper quarantine flag is cleared automatically after install
    (CodeConvoy is open source but not yet notarized with Apple). If macOS
    still reports the app as damaged, run:

      xattr -cr /Applications/CodeConvoy.app
  EOS
end
