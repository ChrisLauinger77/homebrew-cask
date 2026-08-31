cask "headsetcontrol-macostray" do
  version "3.0.0"
  sha256 "adc0fded40d0e1402331bff6a30cbf3334a57b3258acc6766ebd429f5ac0d516"

  url "https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray/releases/download/v#{version}/HeadsetControl-MacOSTray.zip"
  name "HeadsetControl-MacOSTray"
  desc "Tray utility for controlling headsets over sapd headsetcontrol binary"
  homepage "https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  depends_on formula: "sapd/headsetcontrol/headsetcontrol"

  app "HeadsetControl-MacOSTray.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/HeadsetControl-MacOSTray.app"]
  end

  caveats <<~EOS
    The Gatekeeper quarantine flag is cleared automatically after install
    (HeadsetControl-MacOSTray is open source but not yet notarized with Apple). If macOS
    still reports the app as damaged, run:

      xattr -cr /Applications/HeadsetControl-MacOSTray.app
  EOS
end
