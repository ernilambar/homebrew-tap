# homebrew-tap

Homebrew tap for CLI tools.

## Tap

```bash
brew tap ernilambar/tap
brew trust ernilambar/tap
```

## Formulae

| Formula | Description |
|---------|-------------|
| [glot](Formula/glot.rb) | CLI tool for translating WordPress `.po` files using any OpenAI-compatible backend. |

## Install

```bash
brew install ernilambar/tap/glot
```

## Development

After editing a formula:

```bash
brew install --build-from-source ernilambar/tap/glot
```

### Releasing a new version (e.g. glot)

1. **Create a new release** in [ernilambar/glot-cli](https://github.com/ernilambar/glot-cli):
   - Tag must be prefixed with `v` (e.g. `v1.0.1`). The release workflow builds and publishes binaries automatically.

2. **Run the release script**, which downloads both binaries, hashes them, and updates the formula in place:
   ```bash
   bin/release-formula glot 1.0.1
   ```
   This works for any formula in this tap that follows the standard `version` / `url` / `sha256` template (e.g. `bin/release-formula domradar 1.0.1`).
