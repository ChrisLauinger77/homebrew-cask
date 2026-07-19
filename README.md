# ChrisLauinger77 Homebrew Tap

This repository is a personal [Homebrew](https://brew.sh/) tap for macOS packages published by ChrisLauinger77.

## Available Packages

| Package | Type | Description |
| --- | --- | --- |
| [headsetcontrol-macostray](https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray) | Cask | Tray utility for controlling headsets through the sapd headsetcontrol binary. |
| [toerings](https://github.com/ChrisLauinger77/toerings) | Cask | Themeable desktop system monitor. |
| [headsetcontrol-latest](https://github.com/Sapd/headsetcontrol) | Formula | Latest HEAD build of headsetcontrol, used by HeadsetControl-MacOSTray. |

## Add This Tap

```sh
brew tap ChrisLauinger77/cask
```

## Install HeadsetControl-MacOSTray

```sh
brew install --cask headsetcontrol-macostray
```

The cask depends on `headsetcontrol-latest`, which Homebrew installs automatically from this tap.

You can also install directly without tapping first:

```sh
brew install --cask ChrisLauinger77/cask/headsetcontrol-macostray
```

## Install Only headsetcontrol-latest

```sh
brew install ChrisLauinger77/cask/headsetcontrol-latest
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
