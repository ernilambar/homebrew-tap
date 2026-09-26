# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.11/glot-darwin-arm64"
      sha256 "8d9428dff19abc366c30548744dd34f3184f6d710fac6d0adee4a0e64ee4a1fa"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.11/glot-darwin-amd64"
      sha256 "91390e2526e522e09f863f36ab300f4836189be63dc326f9ae6066bc5e1da8ee"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
