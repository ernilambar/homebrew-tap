# typed: false
# frozen_string_literal: true

class Skycast < Formula
  desc "Terminal weather app"
  homepage "https://github.com/ernilambar/skycast"
  url "https://github.com/ernilambar/skycast/releases/download/v1.0.5/skycast-darwin-arm64"
  sha256 "c97aa8bd3fdc830ac31cfb827c67bb92f4165fdb89c0308544636c54aab9c161"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install Dir["skycast-darwin-*"].first => "skycast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skycast --version")
  end
end
