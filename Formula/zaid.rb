# typed: false
# frozen_string_literal: true

class Zaid < Formula
  desc "AI-powered CLI toolkit"
  homepage "https://github.com/ernilambar/zaid"
  version "2.0.0"
  license "MIT"

  depends_on arch: :arm64

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/zaid/releases/download/v2.0.0/zaid-darwin-arm64"
      sha256 "50d6731e8d7b24c9b2ee82c47d635bcd0f3f4927c7282280ae8eef6832b83f00"
    end
  end

  def install
    bin.install Dir["zaid-darwin-*"].first => "zaid"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zaid --version")
  end
end
