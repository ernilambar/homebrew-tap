# typed: false
# frozen_string_literal: true

class Skycast < Formula
  desc "Terminal weather app"
  homepage "https://github.com/ernilambar/skycast"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.5/skycast-darwin-arm64"
      sha256 "c97aa8bd3fdc830ac31cfb827c67bb92f4165fdb89c0308544636c54aab9c161"
    end
    on_intel do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.5/skycast-darwin-amd64"
      sha256 "737bdf651a246070ade6b2bcdbfb1bddcc139ee51df4a4ef66896f91026207e6"
    end
  end

  def install
    bin.install Dir["skycast-darwin-*"].first => "skycast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skycast --version")
  end
end
