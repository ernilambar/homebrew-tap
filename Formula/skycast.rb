# typed: false
# frozen_string_literal: true

class Skycast < Formula
  desc "Terminal weather app"
  homepage "https://github.com/ernilambar/skycast"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.4/skycast-darwin-arm64"
      sha256 "37973d2ef434f0bd2a27ca473320bdd3d7e71bfbfcf99df30416e571c6bd9969"
    end
    on_intel do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.4/skycast-darwin-amd64"
      sha256 "5e8b6ddc43a5426c13c0e41cfc732e3e93a6af94b2bd3f933dbd8fa7f3fdd41e"
    end
  end

  def install
    bin.install Dir["skycast-darwin-*"].first => "skycast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skycast --version")
  end
end
