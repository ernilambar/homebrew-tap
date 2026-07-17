# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.0/glot-darwin-arm64"
      sha256 "ed0caa355a3d980ee1becdb25f577ccceed8b12ea3a02d3ac02dbc8ec290dd0d"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.0/glot-darwin-amd64"
      sha256 "2c39285eeb5173abdb6fa30de7bf4f6cca9e27d209a0b21850b88d34614b9015"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
