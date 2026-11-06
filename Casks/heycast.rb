cask "heycast" do
  version "0.2.0"
  sha256 "bee545ae9d2d92c3ac2751c66e2f95e625780fd232783f934b9fd0cf82ddef7b"

  url "https://github.com/ernilambar/heycast/releases/download/v#{version}/Heycast-macos-arm64.zip"
  name "Heycast"
  desc "Keyboard-driven launcher palette"
  homepage "https://github.com/ernilambar/heycast"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Heycast.app"

  # The app is signed with a stable self-signed identity but not notarized;
  # drop the quarantine flag so Gatekeeper does not block the first launch.
  # It must never be re-signed here: the signature is the TCC key.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Heycast.app"]
  end

  zap trash: "~/Library/Application Support/net.nilambar.heycast"
end
