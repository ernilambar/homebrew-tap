# typed: false
# frozen_string_literal: true

class Epfix < Formula
  desc "Fix episode names in place"
  homepage "https://github.com/ernilambar/epfix"
  version "0.1.1"
  license "MIT"

  depends_on arch: :arm64

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/epfix/releases/download/v0.1.1/epfix-darwin-arm64"
      sha256 "1c499e03c4cd1e3c00d20859d65aeb8fb820ec47b0a2bc434cbab82d9e3479a8"
    end
  end

  def install
    bin.install Dir["epfix-darwin-*"].first => "epfix"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/epfix --version")
  end
end
