cask "kaze" do
  version "0.1.4"
  sha256 "a221b0c809cbe303c14d42e97a4c936e7bf40c42b2180424c86ba9fbb382a377"

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
