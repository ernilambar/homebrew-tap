cask "chatmio" do
  version "0.1.0"
  sha256 "4a4cd68875197f8d09b21206f1311a3e1d7eb703b2d3bbcd1910be2570377bef"

  url "https://github.com/ernilambar/chatmio/releases/download/v#{version}/Chatmio-macos-arm64.zip"
  name "Chatmio"
  desc "Desktop client for OpenAI-compatible chat APIs"
  homepage "https://github.com/ernilambar/chatmio"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Chatmio.app"

  # The app is ad-hoc signed, not notarized; drop the quarantine flag so
  # Gatekeeper does not block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Chatmio.app"]
  end

  zap trash: "~/Library/Application Support/chatmio"
end
