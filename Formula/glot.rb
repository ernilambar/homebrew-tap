# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.4/glot-darwin-arm64"
      sha256 "26953bab0d6ad29f7f0d0b937d840ebb06f60808c9b4b552a78ec50dc9669909"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.4/glot-darwin-amd64"
      sha256 "5ff0a294b0de18ec783bbe4339aac4a5418af39d4b3adcd494460a6b32756d0d"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
