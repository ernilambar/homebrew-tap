# typed: false
# frozen_string_literal: true

class Skycast < Formula
  desc "Terminal weather app"
  homepage "https://github.com/ernilambar/skycast"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.1/skycast-darwin-arm64"
      sha256 "519fbd4e5529499a86355535f396b3143ae3da6961a98c91a6a8f9a78bf213ce"
    end
    on_intel do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.1/skycast-darwin-amd64"
      sha256 "de082d2d1f3d9fdb22db52f6f46f06427e6cd6213913d38a927cf31054df9874"
    end
  end

  def install
    bin.install Dir["skycast-darwin-*"].first => "skycast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skycast --version")
  end
end
