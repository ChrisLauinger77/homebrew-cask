# ChrisLauinger77 Homebrew Tap

This repository is a personal [Homebrew](https://brew.sh/) tap for macOS packages published by ChrisLauinger77.

## Available Packages

| Package | Type | Description |
| --- | --- | --- |
| [headsetcontrol-macostray](https://github.com/ChrisLauinger77/HeadsetControl-MacOSTray) | Cask | Tray utility for controlling headsets through the sapd headsetcontrol binary. |
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

## macOS Security Notice

`HeadsetControl-MacOSTray` is not signed. If macOS blocks the app after installation, open **System Settings > Privacy & Security** and allow it there, or right-click the app in Finder and choose **Open**.

## License

This tap is licensed under the GNU General Public License v3.0. See [LICENSE](LICENSE) for details.
