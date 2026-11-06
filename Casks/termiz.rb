cask "termiz" do
  version "0.1.2"
  sha256 "8cf8f8ccab1e9f2eb8226033e33c9880f39bf5e300e92a409444c53a2ff089bf"

  url "https://github.com/ernilambar/termiz/releases/download/v#{version}/Termiz-macos-arm64.zip"
  name "Termiz"
  desc "Minimal, GPU-accelerated terminal emulator"
  homepage "https://github.com/ernilambar/termiz"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Termiz.app"

  # The app is ad-hoc signed, not notarized; drop the quarantine flag so
  # Gatekeeper does not block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Termiz.app"]
  end

  zap trash: "~/Library/Application Support/net.nilambar.termiz"
end
