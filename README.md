# ChrisLauinger77 Homebrew Tap

This repository is a personal [Homebrew](https://brew.sh/) tap for macOS packages published by ChrisLauinger77.

## Available Packages

| Package | Type | Description |
| --- | --- | --- |
| [headsetcontrol-macostray](https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray) | Cask | Tray utility for controlling headsets through the sapd headsetcontrol binary. |
| [toerings](https://github.com/ChrisLauinger77/toerings) | Cask | Themeable desktop system monitor. |

## Add This Tap

```sh
brew tap ChrisLauinger77/cask
brew tap sapd/headsetcontrol
brew trust --formula sapd/headsetcontrol/headsetcontrol
```

[Homebrew 6 and later require explicit trust](https://docs.brew.sh/Tap-Trust)
for non-official taps. The commands above trust only the HeadsetControl formula,
not the entire external tap.

## Install HeadsetControl-MacOSTray

```sh
brew install --cask headsetcontrol-macostray
```

The cask depends on the official `sapd/headsetcontrol/headsetcontrol` formula,
which Homebrew installs automatically.

You can also install directly without explicitly tapping this repository first:

```sh
brew tap sapd/headsetcontrol
brew trust --formula sapd/headsetcontrol/headsetcontrol
brew install --cask ChrisLauinger77/cask/headsetcontrol-macostray
```

## Install ToeRings

```sh
brew install --cask toerings
```

You can also install directly without tapping first:

```sh
brew install --cask ChrisLauinger77/cask/toerings
```

## Update

Update Homebrew and installed packages:

```sh
brew update
brew upgrade
```

Upgrade only HeadsetControl-MacOSTray:

```sh
brew upgrade --cask headsetcontrol-macostray
```

Upgrade only ToeRings:

```sh
brew upgrade --cask toerings
```

## Automated Cask Updates

The casks are updated by one central GitHub Actions workflow. Publishing a supported app
release triggers a targeted check, and a daily scheduled run checks every configured cask
as a fallback. Updates are proposed as pull requests after the cask syntax and Homebrew
style have been validated.

## macOS Security Notice

The macOS apps in this tap are not notarized. If macOS blocks an app after installation,
open **System Settings > Privacy & Security** and allow it there, or right-click the app
in Finder and choose **Open**.

## License

This tap is licensed under the GNU General Public License v3.0. See [LICENSE](LICENSE) for details.
