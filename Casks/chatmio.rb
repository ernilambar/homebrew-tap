cask "chatmio" do
  version "0.1.1"
  sha256 "b9a9857e2fd33298afd2013309dc32f5e0582c2836084a64672a8f18dbbef225"

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
