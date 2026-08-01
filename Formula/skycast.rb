# typed: false
# frozen_string_literal: true

class Skycast < Formula
  desc "Terminal weather app"
  homepage "https://github.com/ernilambar/skycast"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.0/skycast-darwin-arm64"
      sha256 "0e6d3dbdd20110cb757c0549c2db3ee44698eaef53b38b5e6584d348dfd8e2cb"
    end
    on_intel do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.0/skycast-darwin-amd64"
      sha256 "0771be4d55153f3c85671a8865576af72e44b1852d782d0d21efe0d3548efb0f"
    end
  end

  def install
    bin.install Dir["skycast-darwin-*"].first => "skycast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skycast --version")
  end
end
