# typed: false
# frozen_string_literal: true

class Eyep < Formula
  desc "Inspect geographical and network details for an IP address or local machine"
  homepage "https://github.com/ernilambar/eyep"
  license "MIT"

  depends_on arch: :arm64

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/eyep/releases/download/v1.2.0/eyep-darwin-arm64"
      sha256 "b2824356859f525a5f4433586c0e6c2f5e971b65ea637f5a9f75af4885c1b409"
    end
  end

  def install
    bin.install Dir["eyep-darwin-*"].first => "eyep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eyep --version")
  end
end
