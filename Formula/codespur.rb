# typed: false
# frozen_string_literal: true

class Codespur < Formula
  desc "AI-powered PR reviewer"
  homepage "https://github.com/ernilambar/codespur"
  version "1.0.5"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/codespur/releases/download/v1.0.5/codespur-darwin-arm64"
      sha256 "3325b608b8e8d67fd531cedd66f5e0212a9f43f605fbb5058c2e28e0684a5e78"
    end
    on_intel do
      url "https://github.com/ernilambar/codespur/releases/download/v1.0.5/codespur-darwin-amd64"
      sha256 "f5c1f0c123e66e53f07dcc1810a22c883b4fe91645ea3365ad5eb507fc1e174e"
    end
  end

  def install
    bin.install Dir["codespur-darwin-*"].first => "codespur"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codespur --version")
  end
end
