# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.2/glot-darwin-arm64"
      sha256 "acc7a63caf1ceea8c102e4620653947d6c31ef1580893b8d9e14502d7b67a1ac"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.2/glot-darwin-amd64"
      sha256 "0e79e8cea14233b8a0124b16106fbb474fefb980636a8fbbf01b0621f4eefffc"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
