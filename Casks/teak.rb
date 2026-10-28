cask "teak" do
  version "0.2.6"
  sha256 "ad52d70705404e0e626e72f155aa8eb2a3b095684e151be9125a5e40c4a1530f"

  url "https://github.com/ernilambar/teak/releases/download/v#{version}/Teak-macos-arm64.zip"
  name "Teak"
  desc "Fast, lightweight text editor"
  homepage "https://github.com/ernilambar/teak"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Teak.app"

  # The app is ad-hoc signed, not notarized; drop the quarantine flag so
  # Gatekeeper does not block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Teak.app"]
  end

  zap trash: "~/Library/Application Support/net.nilambar.teak"
end
