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

  caveats <<~EOS
    #{token} is ad-hoc signed but not notarized. On first launch, Control-click the app
    in Finder, choose 'Open', and confirm the security dialog.
  EOS
end
