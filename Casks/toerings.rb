cask "toerings" do
  version "0.3.3"
  sha256 "9276a5a92a159b9f8b973e02f7eea85265f625f88aee4c258e6f98358016f3c6"

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
