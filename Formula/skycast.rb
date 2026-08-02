# typed: false
# frozen_string_literal: true

class Skycast < Formula
  desc "Terminal weather app"
  homepage "https://github.com/ernilambar/skycast"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.3/skycast-darwin-arm64"
      sha256 "1cc5cc2293d38c5ed9d6f469db6387eada6df421e40c5f90cd9e9e1bc81b32ea"
    end
    on_intel do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.3/skycast-darwin-amd64"
      sha256 "d8077ae4d326b7482fa24bee7e523e88aba19080d4ace02311b1ad707536ba3f"
    end
  end

  def install
    bin.install Dir["skycast-darwin-*"].first => "skycast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skycast --version")
  end
end
