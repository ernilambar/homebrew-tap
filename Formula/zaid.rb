# typed: false
# frozen_string_literal: true

class Zaid < Formula
  desc "AI-powered CLI toolkit"
  homepage "https://github.com/ernilambar/zaid"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/zaid/releases/download/v1.0.3/zaid-darwin-arm64"
      sha256 "89323c2ae14f52d5fda2276c862848190c0939c32191dc6dd5d45009cc034c90"
    end
    on_intel do
      url "https://github.com/ernilambar/zaid/releases/download/v1.0.3/zaid-darwin-amd64"
      sha256 "b51c47c09f30399d9dd8039efd1d59c8c7fb8337bdcdf0403f8e2586c1c0ff25"
    end
  end

  def install
    bin.install Dir["zaid-darwin-*"].first => "zaid"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zaid --version")
  end
end
