# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.12/glot-darwin-arm64"
  sha256 "8f9ee544f4ea7c6dca5af3c6270c127dbb96e7e6c990de5e2e584011eeddefeb"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
