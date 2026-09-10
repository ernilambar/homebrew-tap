# typed: false
# frozen_string_literal: true

class Wxbot < Formula
  desc "Conversational weather assistant CLI for any OpenAI-compatible backend"
  homepage "https://github.com/ernilambar/wxbot"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/wxbot/releases/download/v0.1.2/wxbot-darwin-arm64"
      sha256 "23aa5ba83887c3f776fd0f7666a89cb3ea3c0bd9d0baf679a0e64a356cd90d11"
    end
    on_intel do
      url "https://github.com/ernilambar/wxbot/releases/download/v0.1.2/wxbot-darwin-amd64"
      sha256 "908b8d0708599ffb7f382891440086c7811f8d9abe5f79f0372513a504d821ba"
    end
  end

  def install
    bin.install Dir["wxbot-darwin-*"].first => "wxbot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wxbot --version")
  end
end
