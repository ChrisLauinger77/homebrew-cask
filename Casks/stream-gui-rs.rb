cask "stream-gui-rs" do
  version "0.1.0"
  sha256 "4be5d7bf80e301d5066de52c13f8055137fe4eca2301e09c32e31bbbc4ffe995"

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
