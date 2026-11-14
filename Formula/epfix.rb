# typed: false
# frozen_string_literal: true

class Epfix < Formula
  desc "Fix episode names in place"
  homepage "https://github.com/ernilambar/epfix"
  version "0.1.2"
  license "MIT"

  depends_on arch: :arm64

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/epfix/releases/download/v0.1.2/epfix-darwin-arm64"
      sha256 "442cc6b06c6b238d0cec43d5076bdeb13d9e323b18ba328a06a0cc90107f85cc"
    end
  end

  def install
    bin.install Dir["epfix-darwin-*"].first => "epfix"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/epfix --version")
  end
end
