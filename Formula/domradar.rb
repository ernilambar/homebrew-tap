# typed: false
# frozen_string_literal: true

class Domradar < Formula
  desc "CLI tool to check domain name availability"
  homepage "https://github.com/ernilambar/domradar"
  url "https://github.com/ernilambar/domradar/releases/download/v1.0.2/domradar-darwin-arm64"
  sha256 "d3875d4255071db9ff13b5d6366f34757daa719131d2db6881959a0e98e9c6ae"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install Dir["domradar-darwin-*"].first => "domradar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/domradar --version")
  end
end
