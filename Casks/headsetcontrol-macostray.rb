cask "headsetcontrol-macostray" do
  version "3.1.1"
  sha256 "160041fbd9e6a33e3badbaf71e7fc2d85d2739d894812a6c96017e4dc8201d57"

  url "https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray/releases/download/v#{version}/HeadsetControl-MacOSTray.zip"
  name "HeadsetControl-MacOSTray"
  desc "Tray utility for controlling headsets over sapd headsetcontrol binary"
  homepage "https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "HeadsetControl-MacOSTray.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/HeadsetControl-MacOSTray.app"]
  end

  caveats <<~EOS
    The Gatekeeper quarantine flag is cleared automatically after install
    (HeadsetControl-MacOSTray is open source but not yet notarized with Apple). If macOS
    still reports the app as damaged, run:

      xattr -cr /Applications/HeadsetControl-MacOSTray.app
  EOS
end
