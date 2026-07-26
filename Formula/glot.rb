# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.6/glot-darwin-arm64"
      sha256 "50e9c337deb7414e259924b0066a8b8d0e84bcfabef8318e47087eb0e91e66a3"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.6/glot-darwin-amd64"
      sha256 "b6857fe01f4369d3fd213efae93fda43e85b4dba7f5514f75ef50d1af0330381"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
