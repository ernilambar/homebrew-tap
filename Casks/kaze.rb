cask "kaze" do
  version "0.1.3"
  sha256 "4d6433e70d5bd53a510e414efe9ba08edb067357c30e7a234a5f1afa87953a45"

  url "https://github.com/ernilambar/kaze/releases/download/v#{version}/Kaze-macos-arm64.zip"
  name "Kaze"
  desc "Lightweight code and plain text editor"
  homepage "https://github.com/ernilambar/kaze"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

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
