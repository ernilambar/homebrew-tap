cask "tinytext" do
  version "0.1.2"
  sha256 "588c93d903a2e6c51c08371966335a4f76b65f34d6da14e8e3cb1657be1de8f7"

  url "https://github.com/ernilambar/tinytext/releases/download/v#{version}/Tinytext-macos-arm64.zip"
  name "Tinytext"
  desc "Native text editor built with GPUI Kit"
  homepage "https://github.com/ernilambar/tinytext"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Tinytext.app"

  # The app is ad-hoc signed, not notarized; drop the quarantine flag so
  # Gatekeeper does not block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Tinytext.app"]
  end

  zap trash: "~/Library/Application Support/net.nilambar.tinytext"
end
