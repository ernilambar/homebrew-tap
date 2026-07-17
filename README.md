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

2. **Get the SHA256** of each binary:
   ```bash
   curl -sL "https://github.com/ernilambar/glot-cli/releases/download/vTAG/glot-darwin-arm64" | shasum -a 256
   curl -sL "https://github.com/ernilambar/glot-cli/releases/download/vTAG/glot-darwin-amd64" | shasum -a 256
   ```

3. **Update `Formula/glot.rb`**: bump `version`, update both `url` and `sha256` values for arm and intel.
