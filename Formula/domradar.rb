# typed: false
# frozen_string_literal: true

class Domradar < Formula
  desc "CLI tool to check domain name availability"
  homepage "https://github.com/ernilambar/domradar"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/domradar/releases/download/v1.0.0/domradar-darwin-arm64"
      sha256 "8786d319d0e713adc38b67d9168a112d881d144d2c0cc4758a971a87bc3b7e75"
    end
    on_intel do
      url "https://github.com/ernilambar/domradar/releases/download/v1.0.0/domradar-darwin-amd64"
      sha256 "3ce587a8c1a913cb05e4d75edb3395e6a4e803cb27f253695ebf53693ff0a121"
    end
  end

  def install
    bin.install Dir["domradar-darwin-*"].first => "domradar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/domradar --version")
  end
end
