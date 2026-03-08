# typed: false
# frozen_string_literal: true

class Kase < Formula
  desc "CLI for converting, detecting, and applying string case (Unix-friendly, pipe-safe)"
  homepage "https://github.com/ernilambar/kase"
  url "https://github.com/ernilambar/kase/archive/refs/tags/0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w", "-o", "kase", "."
    bin.install "kase"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/kase --help")
  end
end
