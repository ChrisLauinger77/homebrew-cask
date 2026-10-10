cask "code-convoy" do
  version "0.6.0"
  sha256 "ca9c63ac7815a8c01b2d4a5c282b73dc22fbe20cee101590d4708ee935a223ef"

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
