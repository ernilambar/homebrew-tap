# typed: false
# frozen_string_literal: true

class Zaid < Formula
  desc "AI-powered CLI toolkit"
  homepage "https://github.com/ernilambar/zaid"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/zaid/releases/download/v1.0.4/zaid-darwin-arm64"
      sha256 "53c3087517cd1267a4d5736bed4a943fc2fc6456ef2821586d8a195f472875c0"
    end
    on_intel do
      url "https://github.com/ernilambar/zaid/releases/download/v1.0.4/zaid-darwin-amd64"
      sha256 "afa083a4a2b6e2f1cb2096075f22df41148d8894f62f07ce52d7792e6c8c3749"
    end
  end

  def install
    bin.install Dir["zaid-darwin-*"].first => "zaid"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zaid --version")
  end
end
