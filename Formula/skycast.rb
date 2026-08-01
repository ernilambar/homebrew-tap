# typed: false
# frozen_string_literal: true

class Skycast < Formula
  desc "Terminal weather app"
  homepage "https://github.com/ernilambar/skycast"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.2/skycast-darwin-arm64"
      sha256 "ab0b4a00c231aeb5444be057e8a33c6fdd7146da6be1f32a950cf0830f43dfed"
    end
    on_intel do
      url "https://github.com/ernilambar/skycast/releases/download/v1.0.2/skycast-darwin-amd64"
      sha256 "31ef6327ca7250b762d2acb2cb0d49373fa749fae11a4a7a2e65515cbcc2925f"
    end
  end

  def install
    bin.install Dir["skycast-darwin-*"].first => "skycast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skycast --version")
  end
end
