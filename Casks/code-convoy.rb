cask "code-convoy" do
  version "1.1.0"
  sha256 "4c5cc331784c0f3a11037a69d5accda8905d0c32b597ab26f382865ae67375d5"

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
