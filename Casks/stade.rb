cask "stade" do
  version "0.1.0"
  sha256 "dc30c067a8162ee3800a1499f094e85511c1338dafdfeaa088b1279394cbbbd9"

  url "https://github.com/ernilambar/stade/releases/download/v#{version}/Stade-macos-arm64.zip"
  name "Stade"
  desc "Run background scripts as launch agents"
  homepage "https://github.com/ernilambar/stade"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Stade.app"

  # The app is ad-hoc signed, not notarized; drop the quarantine flag so
  # Gatekeeper does not block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Stade.app"]
  end

  # Launch agent plists live in the user's ~/Library/LaunchAgents and are the
  # scripts the user added, so uninstalling keeps them; only the logs are ours.
  zap trash: "~/Library/Logs/Stade"
end
