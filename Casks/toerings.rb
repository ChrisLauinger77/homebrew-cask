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

  caveats <<~EOS
    #{token} is ad-hoc signed but not notarized. On first launch, Control-click the app
    in Finder, choose 'Open', and confirm the security dialog.
  EOS
end
