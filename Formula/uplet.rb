# typed: false
# frozen_string_literal: true

class Uplet < Formula
  desc "Checks if a URL is up and the page actually exists, not just a soft 404"
  homepage "https://github.com/ernilambar/uplet"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/uplet/releases/download/v1.0.0/uplet-darwin-arm64"
      sha256 "fe2c27c860d73d930070dd0a1e0a84986e7c25c8fe38b893b1587db890583af6"
    end
    on_intel do
      url "https://github.com/ernilambar/uplet/releases/download/v1.0.0/uplet-darwin-amd64"
      sha256 "95f110c99287607f80fe48ed6eb6112e23294e9bc3b57e9187ca780a84857b40"
    end
  end

  def install
    bin.install Dir["uplet-darwin-*"].first => "uplet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uplet --version")
  end
end
