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
| [domradar](Formula/domradar.rb) | CLI tool to check domain name availability. |
| [eyep](Formula/eyep.rb) | Inspect geographical and network details for an IP address or local machine. |
| [glot](Formula/glot.rb) | CLI tool for translating WordPress `.po` files using any OpenAI-compatible backend. |
| [skycast](Formula/skycast.rb) | Terminal weather app. |
| [uplet](Formula/uplet.rb) | Checks if a URL is up and the page actually exists, not just a soft 404. |
| [zaid](Formula/zaid.rb) | AI-powered CLI toolkit. |

## Install

```bash
brew install ernilambar/tap/glot
```

## Development

After editing a formula:

```bash
brew install --build-from-source ernilambar/tap/glot
```

### Adding a new formula

1. **Create a release** in the upstream repo, with binaries named `<name>-darwin-arm64` and `<name>-darwin-amd64` attached (tag prefixed with `v`, e.g. `v1.0.0`).

2. **Run the add script**, which fetches the asset hashes and repo license from GitHub and writes the formula from the standard template:
   ```bash
   bin/add-formula uplet ernilambar/uplet 1.0.0 "Checks if a URL is up and the page actually exists, not just a soft 404"
   ```
   This assumes the standard `version` / `url` / `sha256` template used by every formula in this tap. It errors out if `Formula/<name>.rb` already exists, or if the release is missing either binary asset.

3. **Sanity-check it** before committing:
   ```bash
   brew audit --formula ernilambar/tap/<name>
   brew install --build-from-source ernilambar/tap/<name>
   brew test <name>
   brew uninstall <name>
   ```
   Note: these commands run against the installed tap at `$(brew --repo ernilambar/tap)`, not this working copy, so copy the new formula file there first (or push/pull) before running them.

4. **Add it to the [Formulae](#formulae) table** above.

### Releasing a new version (e.g. domradar)

1. **Create a new release** in the upstream repo, e.g. [ernilambar/domradar](https://github.com/ernilambar/domradar):
   - Tag must be prefixed with `v` (e.g. `v1.0.1`). The release workflow builds and publishes binaries automatically.

2. **Run the release script**, which downloads both binaries, hashes them, and updates the formula in place:
   ```bash
   bin/release-formula domradar 1.0.1
   ```
   This works for any formula in this tap that follows the standard `version` / `url` / `sha256` template (e.g. `bin/release-formula glot 1.0.9`).

3. **Verify the update** (as done for `eyep` `1.0.1`):
   - For formulas **without** an explicit `version` line (like `eyep`, where version is inferred from the URL), `bin/release-formula` errors with `Could not find a version line`. Update manually — always download to a file first before hashing (never pipe `curl` to `shasum`):
     ```bash
     curl -sLo /tmp/eyep-1.0.1 "https://github.com/ernilambar/eyep/releases/download/v1.0.1/eyep"
     shasum -a 256 /tmp/eyep-1.0.1
     # 29dab417b51b695091e51fe95822a54a59b09e7c6396d2f2718d04996c63d5d1
     ```
     Then update `url` and `sha256` in `Formula/eyep.rb`.
   - Style-check:
     ```bash
     brew style Formula/eyep.rb
     # 1 file inspected, no offenses detected
     ```
   - Audit (use formula name — `brew audit [path]` is disabled):
     ```bash
     brew audit --strict --formula ernilambar/tap/eyep
     ```

