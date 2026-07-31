# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.8/glot-darwin-arm64"
      sha256 "ed665fe8d4a876dd3a7dbd697e18ecfcf3e0779ac8eb0b114466cf3b4baa0d13"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.8/glot-darwin-amd64"
      sha256 "4fd4135fc9a8d3f6939f08fb698da6a02104aa0dc5e9d7285965265a85bc4073"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
