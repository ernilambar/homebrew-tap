cask "tinytext" do
  version "0.1.4"
  sha256 "b036ab23848d0552e39062062bc8c51edde0b38d8ff8d933194ca07f6ebcfbda"

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
