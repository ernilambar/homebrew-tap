# typed: false
# frozen_string_literal: true

class Komit < Formula
  desc "AI commit messages from your staged diff"
  homepage "https://github.com/ernilambar/komit"
  url "https://github.com/ernilambar/komit/releases/download/v0.1.2/komit-v0.1.2-darwin-arm64.tar.gz"
  sha256 "6f3634dd3960066b96dfdd3ee0344a8435eab4387bc35d1e1bb19ac0c5795329"
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
