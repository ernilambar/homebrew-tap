# homebrew-tap

Homebrew tap for personal projects.

## Tap

```bash
brew tap ernilambar/tap
```

## Formulae

| Formula | Description |
|---------|-------------|
| [kase](Formula/kase.rb) | CLI for converting, detecting, and applying string case (kebab, snake, camel, etc.). Unix-friendly, pipe-safe. |

## Install

```bash
brew install ernilambar/tap/kase
```

## Development

After editing a formula:

```bash
brew install --build-from-source ernilambar/tap/kase
```

### Releasing a new version (e.g. kase)

1. **Create a new release in the project repo** (e.g. [ernilambar/kase](https://github.com/ernilambar/kase)):
   - Create and push a tag: `git tag 0.2.0 && git push origin 0.2.0`
   - Or create a release on GitHub: **Releases** → **Create a new release** → choose or create a tag (e.g. `0.2.0`).

2. **Get the SHA256** of the source tarball (replace `TAG` with your tag, e.g. `0.2.0`):
   ```bash
   curl -sL "https://github.com/ernilambar/kase/archive/refs/tags/TAG.tar.gz" | shasum -a 256
   ```
   Copy the first value (the 64-character hash); the part after the space is just `-` (stdin).

3. **Update `Formula/kase.rb`**: set `url` to the new tag and paste the hash into `sha256`:
   ```ruby
   url "https://github.com/ernilambar/kase/archive/refs/tags/0.2.0.tar.gz"
   sha256 "paste_the_64_char_hash_here"
   ```
