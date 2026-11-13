# typed: false
# frozen_string_literal: true

class Epfix < Formula
  desc "Fix episode names in place"
  homepage "https://github.com/ernilambar/epfix"
  version "0.1.0"
  license "MIT"

  depends_on arch: :arm64

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/epfix/releases/download/v0.1.0/epfix-darwin-arm64"
      sha256 "8ced87eaa00637252e36c31c64f6a116b78b23ebbd0109722be59ddcb09b09a6"
    end
  end

  def install
    bin.install Dir["epfix-darwin-*"].first => "epfix"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/epfix --version")
  end
end
