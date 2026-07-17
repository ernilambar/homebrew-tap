# homebrew-tap

## SHA256 for prebuilt binaries

**Never compute sha256 by piping curl to shasum.** curl decompresses HTTP transport encoding on the fly, which can differ from what Homebrew writes to disk.

Always download to a file first:

```bash
curl -sLo /tmp/glot-arm64 "https://github.com/ernilambar/glot-cli/releases/download/vTAG/glot-darwin-arm64"
shasum -a 256 /tmp/glot-arm64
```

Or use `brew fetch` after setting the formula url/sha256 to a placeholder — Homebrew will report the correct hash in the error output.
