# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.3/glot-darwin-arm64"
      sha256 "567ffca5e13aa49bd4510b6a8a383f0c8de4ee1c91f5dea29fac939474dd1d93"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.3/glot-darwin-amd64"
      sha256 "fd5c09c7c5d969b296c73c78fe4c9c91e357b6230be1fddd17e249d2a441aaab"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
