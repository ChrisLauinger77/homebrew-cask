cask "toerings" do
  version "0.3.2"
  sha256 "acfb9c43535af1e83547aa42c98e040a32bc138a8806bdf8a25864816ae07d14"

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
