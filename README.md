# homebrew-tap

Homebrew tap for CLI tools and macOS apps.

All formulae and casks are Apple Silicon (arm64) only; Intel Macs are not supported.

## Tap

```bash
brew tap ernilambar/tap
brew trust ernilambar/tap
```

## Formulae

| Formula | Description |
|---------|-------------|
| [domradar](https://github.com/ernilambar/domradar) | CLI tool to check domain name availability. |
| [epfix](https://github.com/ernilambar/epfix) | Fix episode names in place. |
| [eyep](https://github.com/ernilambar/eyep) | Inspect geographical and network details for an IP address or local machine. |
| [glot](https://github.com/ernilambar/glot-cli) | CLI tool for translating WordPress `.po` files using any OpenAI-compatible backend. |
| [komit](https://github.com/ernilambar/komit) | AI commit messages from your staged diff. |
| [skycast](https://github.com/ernilambar/skycast) | Terminal weather app. |
| [uplet](https://github.com/ernilambar/uplet) | Checks if a URL is up and the page actually exists, not just a soft 404. |
| [wxbot](https://github.com/ernilambar/wxbot) | AI weather assistant in your terminal. |
| [zaid](https://github.com/ernilambar/zaid) | AI-powered CLI toolkit. |

## Casks

| Cask | Description |
|------|-------------|
| [chatmio](https://github.com/ernilambar/chatmio) | Desktop client for OpenAI-compatible chat APIs. |
| [heycast](https://github.com/ernilambar/heycast) | Keyboard-driven launcher palette. |
| [kaze](https://github.com/ernilambar/kaze) | Lightweight code and plain text editor. |
| [stade](https://github.com/ernilambar/stade) | Run background scripts as launch agents. |
| [teak](https://github.com/ernilambar/teak) | Fast, lightweight text editor. |
| [termiz](https://github.com/ernilambar/termiz) | Minimal, GPU-accelerated terminal emulator. |

A plain `brew uninstall --cask <name>` leaves app settings alone. Adding `--zap`
removes them too. For editors such as [kaze](https://github.com/ernilambar/kaze)
that includes hand-edited config (`~/Library/Application Support/Kaze`:
`settings.json`, `keybindings.json`, `themes/`), and kaze has no settings sync,
so back that folder up before zapping.

## Install

```bash
brew install ernilambar/tap/glot
brew install --cask ernilambar/tap/teak
```

## Development

After editing a formula:

```bash
brew install --build-from-source ernilambar/tap/glot
```

### Adding a new formula

1. **Create a release** in the upstream repo, with a binary named `<name>-darwin-arm64` attached (tag prefixed with `v`, e.g. `v1.0.0`).

2. **Run the add script**, which fetches the asset hashes and repo license from GitHub and writes the formula from the standard template:
   ```bash
   bin/add-formula uplet ernilambar/uplet 1.0.0 "Checks if a URL is up and the page actually exists, not just a soft 404"
   ```
   This assumes the standard `url` / `sha256` template used by every formula in this tap (no `version` line; Homebrew reads it from the URL). It errors out if `Formula/<name>.rb` already exists, or if the release is missing the arm64 asset. The formula is arm64-only (`depends_on arch: :arm64`).

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

2. **Run the release script**, which downloads each asset, hashes it, and updates the formula in place:
   ```bash
   bin/release-formula domradar 1.0.1
   ```
   This works for any formula in this tap (e.g. `bin/release-formula glot 1.0.9`), The version is inferred from the URL tag (an explicit `version` line, if present, is updated too). The old version and tag format are detected from the existing URL. The new release must contain a `<name>-darwin-arm64` asset.

3. **Verify the update** (as done for `eyep` `1.2.0`):
   - If you ever need to update manually, always download to a file first before hashing (never pipe `curl` to `shasum`):
      ```bash
      curl -sLo /tmp/eyep "https://github.com/ernilambar/eyep/releases/download/v1.2.0/eyep-darwin-arm64"
      shasum -a 256 /tmp/eyep
      ```
   - Style-check:
     ```bash
     brew style Formula/eyep.rb
     # 1 file inspected, no offenses detected
     ```
   - Audit (use formula name — `brew audit [path]` is disabled):
     ```bash
     brew audit --strict --formula ernilambar/tap/eyep
     ```

### Adding a new cask

1. **Create a release** in the upstream repo (tag prefixed with `v`, e.g. `v0.1.0`) with a `<Name>-macos-arm64.zip` asset containing the `.app` bundle.

2. **Run the add script**, which downloads the asset, hashes it, and reads the app name and `LSMinimumSystemVersion` from the bundle inside it:
   ```bash
   bin/add-cask stade ernilambar/stade 0.1.0 "Run background scripts as launch agents"
   ```
   It writes `Casks/<name>.rb` from the standard template (`livecheck` with `strategy :github_latest`, `depends_on arch: :arm64`, `depends_on macos: <from the bundle>`, `app "<Name>.app"`, and a `postflight_steps` block that drops `com.apple.quarantine`). It errors out if `Casks/<name>.rb` already exists or the release has no `*-macos-arm64.zip` asset. Pass a Homebrew symbol as the optional fifth argument (`bin/add-cask <name> <owner/repo> <version> <desc> :sonoma`) when the bundle's minimum macOS cannot be read.

3. **Fill in `zap trash:`** with only the paths the app owns (its Application Support directory, or its log directory) and delete the TODO comment.

4. **Audit** against the installed tap, then add the cask to the [Casks](#casks) table above:
   ```bash
   brew audit --cask --online ernilambar/tap/<name>
   ```

### Releasing a new cask version (e.g. teak)

1. **Create a new release** in the upstream repo (tag prefixed with `v`, e.g. `v0.1.2`).

2. **Run the release script**, which downloads the asset, hashes it, and updates `version` and `sha256` in place:
   ```bash
   bin/release-cask teak 0.2.0
   ```
   The cask's `url` must interpolate `#{version}`; the script errors out otherwise.

3. **Audit** (against the installed tap, as with formulae):
   ```bash
   brew audit --cask --online ernilambar/tap/teak
   ```
