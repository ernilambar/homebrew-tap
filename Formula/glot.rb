# typed: false
# frozen_string_literal: true

class Glot < Formula
  desc "CLI tool for translating WordPress .po files using any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/glot-cli"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.7/glot-darwin-arm64"
      sha256 "23f5261da2b548d3e0043f306e6083cc57eebb8c491ab7f1e0848fc6cc3575fc"
    end
    on_intel do
      url "https://github.com/ernilambar/glot-cli/releases/download/v1.0.7/glot-darwin-amd64"
      sha256 "e16e531695254501395f5ffa62ad64e3e5e3a4a0aa881e68e3436bfe13bf4194"
    end
  end

  def install
    bin.install Dir["glot-darwin-*"].first => "glot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glot --version")
  end
end
