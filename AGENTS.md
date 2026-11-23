# homebrew-tap

## Exec helpers

The `bin/` directory contains helper scripts for managing formulae and casks:

- `bin/add-formula <name> <owner/repo> <version> <desc>` — Creates a new formula from a GitHub release. Fetches asset hashes (from GitHub digests or by downloading), detects the repo license, and writes `Formula/<name>.rb` from the standard template. The amd64 asset is optional; without it the formula is arm64-only (`depends_on arch: :arm64`, no `on_intel`).
- `bin/release-formula <formula> <new_version>` — Bumps an existing formula to a new version. Downloads each release asset to a temp directory, hashes it, and rewrites the version/url/sha256 fields in place. Works with arm64-only and arm64/amd64 formulae; the version line is optional (falls back to the URL tag). If the new release's `on_intel` asset 404s, it drops the `on_intel` block and adds `depends_on arch: :arm64`.
- `bin/release-cask <cask> <new_version>` — Bumps an existing cask in `Casks/` to a new version. Downloads the release asset, hashes it, and rewrites the version/sha256 fields in place. Requires a single `version`/`sha256` pair and a `url` that interpolates `#{version}`.
- `bin/add-cask <name> <owner/repo> <version> <desc> [min_macos]` — Creates a new cask from a GitHub release. Downloads the `*-macos-arm64.zip` asset, hashes it, reads the app name and `LSMinimumSystemVersion` from the bundle inside, and writes `Casks/<name>.rb` from the standard template. Leaves a TODO where `zap trash:` goes. `min_macos` is only needed when the bundle's minimum macOS cannot be read.

All four scripts strip a leading `v` from the version argument and exit non-zero if `brew style` fails. `add-cask`, `release-cask` and `release-formula` abort if a downloaded file's sha256 differs from GitHub's published digest.

## Commit messages

Never add `Co-Authored-By:` trailers, or any attribution to AI assistants or third parties, to commit messages in this repo. GitHub credits `Co-Authored-By` addresses as co-authors and lists them in the repository's Contributors sidebar.

A plain subject line (and body, when useful) is enough. No trailers, no `Generated with ...` footers.

## SHA256 for prebuilt binaries

**Never compute sha256 by piping curl to shasum.** curl decompresses HTTP transport encoding on the fly, which can differ from what Homebrew writes to disk.

Always download to a file first:

```bash
curl -sLo /tmp/binary-name "https://github.com/OWNER/REPO/releases/download/vTAG/darwin-arm64"
shasum -a 256 /tmp/binary-name
```

Or use `brew fetch` after setting the formula url/sha256 to a placeholder — Homebrew will report the correct hash in the error output.
