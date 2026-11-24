# typed: false
# frozen_string_literal: true

class Epfix < Formula
  desc "Fix episode names in place"
  homepage "https://github.com/ernilambar/epfix"
  url "https://github.com/ernilambar/epfix/releases/download/v0.1.3/epfix-darwin-arm64"
  sha256 "9eec60533e3f72232598369884f3add71a80db7bf8e6305a7db6cd88f0c677ec"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install Dir["epfix-darwin-*"].first => "epfix"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/epfix --version")
  end
end
