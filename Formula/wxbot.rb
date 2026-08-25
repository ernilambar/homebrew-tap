# typed: false
# frozen_string_literal: true

class Wxbot < Formula
  desc "Conversational weather assistant CLI for any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/wxbot"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/wxbot/releases/download/v0.1.0/wxbot-darwin-arm64"
      sha256 "3332ab85ade733f687c399831a57c961b53e949c6f74137d94d08601c5e817f7"
    end
    on_intel do
      url "https://github.com/ernilambar/wxbot/releases/download/v0.1.0/wxbot-darwin-amd64"
      sha256 "4e1eef6db4fff20aac824000ee2c277daa2f3e7a50f9ab40470148039397b72e"
    end
  end

  def install
    bin.install Dir["wxbot-darwin-*"].first => "wxbot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wxbot --version")
  end
end
