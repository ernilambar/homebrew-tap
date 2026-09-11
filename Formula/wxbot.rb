# typed: false
# frozen_string_literal: true

class Wxbot < Formula
  desc "Conversational weather assistant CLI for any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/wxbot"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/wxbot/releases/download/v0.1.3/wxbot-darwin-arm64"
      sha256 "8078bd9cf043f5889cd2c353a13a3d5b2de6b279389f64f21236293b7b807ba1"
    end
    on_intel do
      url "https://github.com/ernilambar/wxbot/releases/download/v0.1.3/wxbot-darwin-amd64"
      sha256 "3e73ba0efbb1ecdae5ea4bad518418574973cb0dd962dfd8de27d81e6495c7a6"
    end
  end

  def install
    bin.install Dir["wxbot-darwin-*"].first => "wxbot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wxbot --version")
  end
end
