cask "toerings" do
  version "0.7.3"
  sha256 "4b03037ec8ade07f07811961a18bd2ca7af76dc522473d096534aad83d364bd6"

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
