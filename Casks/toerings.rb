cask "toerings" do
  version "0.3.0"
  sha256 "221bc4d71c960f77930e8be52a1be8acda8c0fac9d99f33d3b9b92cf60ac3e23"

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
