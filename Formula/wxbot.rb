# typed: false
# frozen_string_literal: true

class Wxbot < Formula
  desc "AI weather assistant in your terminal"
  homepage "https://github.com/ernilambar/wxbot"
  version "0.1.5"
  license "MIT"

  depends_on arch: :arm64

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/wxbot/releases/download/v0.1.5/wxbot-darwin-arm64"
      sha256 "ed646f01a9312a1db5e83156136f806aefd4c7cdfbf9271cabc76faea8acda16"
    end
  end

  def install
    bin.install Dir["wxbot-darwin-*"].first => "wxbot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wxbot --version")
  end
end
