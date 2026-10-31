# typed: false
# frozen_string_literal: true

class Domradar < Formula
  desc "CLI tool to check domain name availability"
  homepage "https://github.com/ernilambar/domradar"
  version "1.0.1"
  license "MIT"

  depends_on arch: :arm64

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/domradar/releases/download/v1.0.1/domradar-darwin-arm64"
      sha256 "f3f4f00c5b3d14a016a9ddf768f821a33b51cbb21216c45aa7893d5fe60b4b27"
    end
  end

  def install
    bin.install Dir["domradar-darwin-*"].first => "domradar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/domradar --version")
  end
end
