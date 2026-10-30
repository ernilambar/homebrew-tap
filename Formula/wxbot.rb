# typed: false
# frozen_string_literal: true

class Wxbot < Formula
  desc "AI weather assistant in your terminal"
  homepage "https://github.com/ernilambar/wxbot"
  version "0.1.4"
  license "MIT"

  depends_on arch: :arm64

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/wxbot/releases/download/v0.1.4/wxbot-darwin-arm64"
      sha256 "a9274c4519c2a9c56636e1a4fcee8bf83fc4ddc3041e856a4e30258db2bf4b60"
    end
  end

  def install
    bin.install Dir["wxbot-darwin-*"].first => "wxbot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wxbot --version")
  end
end
