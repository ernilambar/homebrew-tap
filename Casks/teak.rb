cask "teak" do
  version "0.2.2"
  sha256 "2b8e0f481a94d00628087a8f875ef5d0188ac37d6cc1bfc72f537c59e82bb749"

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
