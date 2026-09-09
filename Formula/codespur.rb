# typed: false
# frozen_string_literal: true

class Codespur < Formula
  desc "AI-powered PR reviewer"
  homepage "https://github.com/ernilambar/codespur"
  version "1.0.3"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/codespur/releases/download/v1.0.3/codespur-darwin-arm64"
      sha256 "b837a555922b7dec8a238ab1f9aaada34bbb9fccbf663feed2fbde5da9bb93eb"
    end
    on_intel do
      url "https://github.com/ernilambar/codespur/releases/download/v1.0.3/codespur-darwin-amd64"
      sha256 "0f2855db56137da8e9204957386da17588f877c299dc192912df833310befa77"
    end
  end

  def install
    bin.install Dir["codespur-darwin-*"].first => "codespur"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codespur --version")
  end
end
