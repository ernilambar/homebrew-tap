cask "tine" do
  version "0.2.0"
  sha256 "9e61b6a836a62f87b486f24e0112e4c653d4c0ec98dd4e339251286b15f038e1"

  url "https://github.com/ernilambar/tine/releases/download/v#{version}/Tine-macos-arm64.zip"
  name "Tine"
  desc "Native text editor built with GPUI Kit"
  homepage "https://github.com/ernilambar/tine"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Tine.app"

  # The app is ad-hoc signed, not notarized; drop the quarantine flag so
  # Gatekeeper does not block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Tine.app"]
  end

  zap trash: "~/Library/Application Support/net.nilambar.tine"
end
