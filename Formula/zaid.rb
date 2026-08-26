# typed: false
# frozen_string_literal: true

class Zaid < Formula
  desc "AI-powered CLI toolkit"
  homepage "https://github.com/ernilambar/zaid"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/zaid/releases/download/v1.0.5/zaid-darwin-arm64"
      sha256 "8c7e110bcfad44c8614cca8c2662f7a2ed6f8266dcd10d1522bb0b08141e6d17"
    end
    on_intel do
      url "https://github.com/ernilambar/zaid/releases/download/v1.0.5/zaid-darwin-amd64"
      sha256 "ab493c8c02f562e0d8f0be6f7647da49ab339abd3a34a0402c6472f2d2d8f9f5"
    end
  end

  def install
    bin.install Dir["zaid-darwin-*"].first => "zaid"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zaid --version")
  end
end
