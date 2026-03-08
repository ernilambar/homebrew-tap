# typed: false
# frozen_string_literal: true

class Kase < Formula
  desc "CLI for converting, detecting, and applying string case (Unix-friendly, pipe-safe)"
  homepage "https://github.com/ernilambar/kase"
  url "https://github.com/ernilambar/kase/archive/refs/tags/0.1.0.tar.gz"
  sha256 "b3b71120a27983a0391a105f23d2a686d81fcba6ecfed7b899b0902ea5863c43"
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
