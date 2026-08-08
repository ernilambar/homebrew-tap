# typed: false
# frozen_string_literal: true

class Zaid < Formula
  desc "AI-powered CLI toolkit"
  homepage "https://github.com/ernilambar/zaid"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/zaid/releases/download/v1.0.2/zaid-darwin-arm64"
      sha256 "0e19842c9b3190a31743a65e1364e067c55c61c4724f8e8181a88b1ade93e620"
    end
    on_intel do
      url "https://github.com/ernilambar/zaid/releases/download/v1.0.2/zaid-darwin-amd64"
      sha256 "52f0c02692fff0109a6ed3a1dbceffeeab0b75f1bd29d7c6d49d05a0a9504064"
    end
  end

  def install
    bin.install Dir["zaid-darwin-*"].first => "zaid"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zaid --version")
  end
end
