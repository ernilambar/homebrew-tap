# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.1/glot-darwin-arm64"
      sha256 "f9d6fc11d22d638ffa17bc4d45b7a5843da56b6bcb9daf1a833e2ba4656c1d1b"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.1/glot-darwin-amd64"
      sha256 "d8d2d6c74bcebd5710fdc039613020526ad5fd07507bfb56f65b870a2aad2e12"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
