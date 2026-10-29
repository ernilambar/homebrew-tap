# typed: false
# frozen_string_literal: true

class Eyep < Formula
  desc "Inspect geographical and network details for an IP address or local machine"
  homepage "https://github.com/ernilambar/eyep"
  url "https://github.com/ernilambar/eyep/releases/download/v1.1.0/eyep"
  sha256 "0be36e7029f05d322bbb331fe6a8101e37f9336e0cccb419c9cd6f917b7fab21"

  depends_on "jq"

  def install
    bin.install "eyep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eyep --version")
  end
end
