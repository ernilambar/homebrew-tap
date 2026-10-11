cask "tinytext" do
  version "0.1.7"
  sha256 "9d1f3080217bb50e17309203c7e8ea025d8f42ce57575fd418c9fd3ca5483611"

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
