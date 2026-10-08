cask "tinytext" do
  version "0.1.6"
  sha256 "02c4d94a1e51b4163643650e38b8b4162a4c28425e937efcf6f37611961ea0b5"

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
