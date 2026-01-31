cask "headsetcontrol-macostray" do
  version "1.5"
  sha256 "88474f65b33da84f052bfd45a0ad879baf6070f5b17c94ea655998f2a9831450"

  url "https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray/releases/download/v#{version}/HeadsetControl-MacOSTray.zip"
  name "HeadsetControl-MacOSTray"
  desc "Tray utility for controlling headsets over sapd headsetcontrol binary"
  homepage "https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on formula: "sapd/headsetcontrol/headsetcontrol"

  app "HeadsetControl-MacOSTray.app"
  
  caveats <<~EOS
    #{token} is not signed. You may need to allow it in System Settings > Privacy & Security
    or by right-clicking the app in Finder and choosing 'Open'.
  EOS

end
