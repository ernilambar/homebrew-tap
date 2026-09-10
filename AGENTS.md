# homebrew-tap

## Exec helpers

The `bin/` directory contains helper scripts for managing formulae:

- `bin/add-formula <name> <owner/repo> <version> <desc>` — Creates a new formula from a GitHub release. Fetches asset hashes (from GitHub digests or by downloading), detects the repo license, and writes `Formula/<name>.rb` from the standard template.
- `bin/release-formula <formula> <new_version>` — Bumps an existing formula to a new version. Downloads each release asset to a temp directory, hashes it, and rewrites the version/url/sha256 fields in place. Works with both standard formulae (explicit version line + arm64/amd64 pair) and eyep-style formulae (no version line, single URL).

## SHA256 for prebuilt binaries

**Never compute sha256 by piping curl to shasum.** curl decompresses HTTP transport encoding on the fly, which can differ from what Homebrew writes to disk.

Always download to a file first:

```bash
curl -sLo /tmp/binary-name "https://github.com/OWNER/REPO/releases/download/vTAG/darwin-arm64"
shasum -a 256 /tmp/binary-name
```

Or use `brew fetch` after setting the formula url/sha256 to a placeholder — Homebrew will report the correct hash in the error output.
