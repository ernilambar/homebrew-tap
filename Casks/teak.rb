cask "teak" do
  version "0.2.7"
  sha256 "c6a514876711b86d80026734024c3756cf3fdfb7b1c063b584243893d1f8ff45"

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
