# typed: false
# frozen_string_literal: true

class Uplet < Formula
  desc "Checks if a URL is up and the page actually exists, not just a soft 404"
  homepage "https://github.com/ernilambar/uplet"
  license "MIT"

  depends_on arch: :arm64

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/uplet/releases/download/v1.0.1/uplet-darwin-arm64"
      sha256 "94bcb86a534c6ab4873596de2c65a4741a880842b6d2715b47e0cf230e1e0fb3"
    end
  end

  def install
    bin.install Dir["uplet-darwin-*"].first => "uplet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uplet --version")
  end
end
