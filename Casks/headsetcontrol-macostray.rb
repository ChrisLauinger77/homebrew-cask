cask "headsetcontrol-macostray" do
  version "2.1"
  sha256 "e464e9c4c8d381e9e73a9633bc3f222e74a4dfcb88e90b90656ae3af56455a4b"

  url "https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray/releases/download/v#{version}/HeadsetControl-MacOSTray.zip"
  name "HeadsetControl-MacOSTray"
  desc "Tray utility for controlling headsets over sapd headsetcontrol binary"
  homepage "https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on formula: "chrislauinger77/cask/headsetcontrol-latest"

  app "HeadsetControl-MacOSTray.app"
  
  caveats <<~EOS
    #{token} is not signed. You may need to allow it in System Settings > Privacy & Security
    or by right-clicking the app in Finder and choosing 'Open'.
  EOS

end
