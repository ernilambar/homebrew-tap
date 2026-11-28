cask "kaze" do
  version "0.1.7"
  sha256 "e9e70f30a3a6cfe64f0693cc59eb4a89a0a7cd640753389f379f511e9dea334f"

  url "https://github.com/ernilambar/kaze/releases/download/v#{version}/Kaze-macos-arm64.zip"
  name "Kaze"
  desc "Lightweight code and plain text editor"
  homepage "https://github.com/ernilambar/kaze"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Kaze.app"

  # The app is ad-hoc signed, not notarized; drop the quarantine flag so
  # Gatekeeper does not block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Kaze.app"]
  end

  zap trash: [
    "~/Library/Application Support/Kaze",
    "~/Library/Caches/net.nilambar.kaze",
    "~/Library/Preferences/net.nilambar.kaze.plist",
    "~/Library/WebKit/net.nilambar.kaze",
  ]
end
