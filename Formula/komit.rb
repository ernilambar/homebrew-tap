# typed: false
# frozen_string_literal: true

class Komit < Formula
  desc "AI commit messages from your staged diff"
  homepage "https://github.com/ernilambar/komit"
  url "https://github.com/ernilambar/komit/releases/download/v0.1.1/komit-v0.1.1-darwin-arm64.tar.gz"
  sha256 "a33eb73fea1a93762b3bbc9e828a25d8fda4af37d4869b3b7bbbecfc4482c957"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "komit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/komit --version")
  end
end
