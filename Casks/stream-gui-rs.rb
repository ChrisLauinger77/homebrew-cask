cask "stream-gui-rs" do
  version "1.5.2"
  sha256 "08aa45279863a5bee4ef5b1690e9476bd3bef61149334d5e9723c1081f51a77c"

  url "https://github.com/ChrisLauinger77/stream-gui-rs/releases/download/v#{version}/Stream-GUI-RS_#{version}_macos_universal.dmg"
  name "Stream GUI RS"
  desc "Browse Twitch and watch streams through Streamlink"
  homepage "https://github.com/ChrisLauinger77/stream-gui-rs"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Stream GUI RS.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/Stream GUI RS.app"]
  end

  caveats <<~EOS
    Streamlink 8.0 or newer and a compatible media player must be installed separately.

    The Gatekeeper quarantine flag is cleared automatically after install
    (Stream GUI RS is open source but not yet notarized with Apple). If macOS
    still reports the app as damaged, run:

      xattr -cr "/Applications/Stream GUI RS.app"
  EOS
end
