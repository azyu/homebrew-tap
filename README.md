# homebrew-tap

Homebrew tap for Azyu tools and applications.

## Available formulae

- `bb` — [bb-cli](https://github.com/azyu/bb-cli), Bitbucket Cloud CLI
- `kis` — [kis-cli](https://github.com/azyu/kis-cli), Korea Investment & Securities Open API CLI
- `krx` — [krx-cli](https://github.com/azyu/krx-cli), Korea Exchange Open API CLI
- `toss` — [tossinvest-cli](https://github.com/azyu/tossinvest-cli), Toss Securities Open API CLI

## Available casks

- `transnovel` — [TransNovel](https://github.com/azyu/transnovel), AI-powered Japanese web novel translator for Apple Silicon Macs

## Install

Install directly:

```bash
brew install azyu/tap/bb
brew install azyu/tap/kis
brew install azyu/tap/krx
brew install azyu/tap/toss
brew install --cask azyu/tap/transnovel
```

Or tap first:

```bash
brew tap azyu/tap
brew install bb
brew install kis
brew install krx
brew install toss
brew install --cask transnovel
```

TransNovel is currently ad-hoc signed and not Apple-notarized. If macOS blocks the quarantined app after the standard `brew install --cask azyu/tap/transnovel`, review the source and release before allowing it to open:

1. Locate `TransNovel` in Finder.
2. Control-click the app, choose **Open**, then confirm **Open**.
3. Alternatively, open **System Settings > Privacy & Security** and choose **Open Anyway** for TransNovel.

Only bypass this warning if you trust the published artifact.

## Upgrade

```bash
brew upgrade bb
brew upgrade kis
brew upgrade krx
brew upgrade toss
brew upgrade --cask --greedy transnovel
```

`transnovel` declares `auto_updates true` because the app includes its own updater. `--greedy` asks Homebrew to upgrade auto-updating casks as well.

## Uninstall

```bash
brew uninstall bb
brew uninstall kis
brew uninstall krx
brew uninstall toss
brew uninstall --cask transnovel
brew untap azyu/tap
```
