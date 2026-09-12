# ParkSangGwon/homebrew-tap

Homebrew casks for my macOS apps.

```sh
brew install --cask ParkSangGwon/tap/claude-autoswitch
```

| Cask | App | Source |
|---|---|---|
| `claude-autoswitch` | Claude AutoSwitch — menu bar app that rotates Claude Code across several Claude accounts | [claude-account-autoswitch](https://github.com/ParkSangGwon/claude-account-autoswitch) |

## Updating a cask

The [release workflow](https://github.com/ParkSangGwon/claude-account-autoswitch/blob/main/.github/workflows/release.yml)
of claude-account-autoswitch bumps `version` and `sha256` here after every release
(`bump-cask.yml`, pushed with the `TAP_GITHUB_TOKEN` secret). To re-point the cask at an
existing release by hand:

```sh
gh workflow run bump-cask.yml -R ParkSangGwon/claude-account-autoswitch -f version=0.1.1
```

Local checks after editing a cask:

```sh
brew audit --cask --online Casks/claude-autoswitch.rb
brew style Casks/claude-autoswitch.rb
```
