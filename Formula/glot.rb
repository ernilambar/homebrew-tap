# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.10/glot-darwin-arm64"
      sha256 "28d70d20ec7dfeaeb881269397f331f08a0a54fbd326f01de8c569eb1b409e28"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.10/glot-darwin-amd64"
      sha256 "5e7fc7bf45dddbbf334862fbb770eb40fa086441b52cf4411a932e5f3b6dc108"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
