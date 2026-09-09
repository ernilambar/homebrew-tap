# typed: false
# frozen_string_literal: true

class Codespur < Formula
  desc "AI-powered PR reviewer"
  homepage "https://github.com/ernilambar/codespur"
  version "1.0.4"

   on_macos do
     on_arm do
       url "https://github.com/ernilambar/codespur/releases/download/v1.0.4/codespur-darwin-arm64"
       sha256 "0f7d5010f75a59f410ba03d52e391646cd76771c9dcbd26c2475484318ac6f7c"
     end
     on_intel do
       url "https://github.com/ernilambar/codespur/releases/download/v1.0.4/codespur-darwin-amd64"
       sha256 "818610ab232a70cbe02591ccb65690126ed18d22b8aafa0ce247f3a3b96aef4b"
     end
   end

  def install
    bin.install Dir["codespur-darwin-*"].first => "codespur"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codespur --version")
  end
end
