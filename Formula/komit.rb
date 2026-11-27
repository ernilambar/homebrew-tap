# typed: false
# frozen_string_literal: true

class Komit < Formula
  desc "AI commit messages from your staged diff"
  homepage "https://github.com/ernilambar/komit"
  url "https://github.com/ernilambar/komit/releases/download/v0.1.0/komit-v0.1.0-darwin-arm64.tar.gz"
  sha256 "d712afc4efd2bcd72420e5a0c176cf394040b45baca1fc9837d8cbfc4adf9fa6"
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
