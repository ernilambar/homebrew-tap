# typed: false
# frozen_string_literal: true

class Kase < Formula
  desc "CLI for converting, detecting, and applying string case (Unix-friendly, pipe-safe)"
  homepage "https://github.com/ernilambar/kase"
  url "https://github.com/ernilambar/kase/archive/refs/tags/0.1.1.tar.gz"
  sha256 "4a6a3e9694ef43f1c6b583682e4fb7f6fb625f25a30a2380f71e9a32734090d0"
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
