# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.5/glot-darwin-arm64"
      sha256 "d681cdb7682cd0bae0c5267a7c6cd3ccee7588cc3ef47e837a0f093ae8922ff8"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.5/glot-darwin-amd64"
      sha256 "e89803cf160c67da106d32ada9debb939e68a2034b8ed5006eb9f7f57e7570ec"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
