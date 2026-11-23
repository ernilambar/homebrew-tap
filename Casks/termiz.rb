cask "termiz" do
  version "0.1.3"
  sha256 "f10cb0a5cab0611491f5dc4cbb690c257ea00e85233b46a64880e38dd045d5d4"

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
