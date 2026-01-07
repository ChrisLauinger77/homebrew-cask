cask "headsetcontrol-macostray" do
  version "1.3"
  sha256 "c060d3759a48d340fbe738468292800c34a78bd44326b1bbccc674c129fdf8bb"

  url "https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray/releases/download/v#{version}/HeadsetControl-MacOSTray.zip"
  name "HeadsetControl-MacOSTray"
  desc "Tray utility for controlling headsets over sapd headsetcontrol binary"
  homepage "https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray"

  depends_on macos: ">= :sonoma"
  depends_on formula: "sapd/headsetcontrol/headsetcontrol"

  app "HeadsetControl-MacOSTray.app"
  
  caveats <<~EOS
    #{token} is not signed. You may need to allow it in System Settings > Privacy & Security
    or by right-clicking the app in Finder and choosing 'Open'.
  EOS

end
