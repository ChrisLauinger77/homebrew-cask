cask "headsetcontrol-macostray" do
  version "2.5"
  sha256 "83996ec1c03edf9d41cfb93f0bb4519dc830034fff7216409ce1f1b358507e5a"

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
