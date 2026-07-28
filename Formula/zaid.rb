# typed: false
# frozen_string_literal: true

class Zaid < Formula
  desc "AI-powered CLI toolkit"
  homepage "https://github.com/ernilambar/zaid"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/zaid/releases/download/v1.0.0/zaid-darwin-arm64"
      sha256 "88f6fba1d59d153f070a867b8218e5a1e17e728cc97821f0ee434833f00a0128"
    end
    on_intel do
      url "https://github.com/ernilambar/zaid/releases/download/v1.0.0/zaid-darwin-amd64"
      sha256 "c204129c623108f2330ee8df4e5d04d67b0d8ddacbc7494b062844c9ff6ee2e4"
    end
  end

  def install
    bin.install Dir["zaid-darwin-*"].first => "zaid"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zaid --version")
  end
end
