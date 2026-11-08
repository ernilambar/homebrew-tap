cask "heycast" do
  version "0.2.3"
  sha256 "253942cc027196923df046d305a9a4cd6cac6b22a18db84748c18237f4565981"

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
