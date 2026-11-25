cask "kaze" do
  version "0.1.5"
  sha256 "f60255469cf12986baf03892687dc61df1dfb6243ee0556ab18aac7f25242113"

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
