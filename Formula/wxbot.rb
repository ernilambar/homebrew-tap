# typed: false
# frozen_string_literal: true

class Wxbot < Formula
  desc "Conversational weather assistant CLI for any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/wxbot"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/wxbot/releases/download/v0.1.1/wxbot-darwin-arm64"
      sha256 "a836b8671f5d2d99afe3719a93247aa22099ffb2b44c2be7897770b5b6444cff"
    end
    on_intel do
      url "https://github.com/ernilambar/wxbot/releases/download/v0.1.1/wxbot-darwin-amd64"
      sha256 "669a2e17a10bd6569bf1ee14f381e791381ea895a72d11ddba16ab32e1da0a7e"
    end
  end

  def install
    bin.install Dir["wxbot-darwin-*"].first => "wxbot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wxbot --version")
  end
end
