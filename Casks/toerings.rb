cask "toerings" do
  version "0.5.0"
  sha256 "1eb420b9e878c9d1dd17f28bb9e43f7677567fb863fbe96bf0902e1d0dcd19c8"

  url "https://github.com/ChrisLauinger77/toerings/releases/download/v#{version}/ToeRings_#{version}_universal.app.zip"
  name "ToeRings"
  desc "Themeable desktop system monitor"
  homepage "https://github.com/ChrisLauinger77/toerings"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "ToeRings.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/ToeRings.app"]
  end

  caveats <<~EOS
    The Gatekeeper quarantine flag is cleared automatically after install
    (ToeRings is open source but not yet notarized with Apple). If macOS
    still reports the app as damaged, run:

      xattr -cr /Applications/ToeRings.app
  EOS
end
