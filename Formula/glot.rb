# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.9/glot-darwin-arm64"
      sha256 "4ff1b96c0c70b827ea33c6db5ef88c5d3e17c9e89325be9a05465f34f1fcc4e6"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.9/glot-darwin-amd64"
      sha256 "5916ec915f4fb51a86251267b46a7fa41f08b41d4404ea0b05c5f28e0b53aa2f"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
