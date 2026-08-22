# typed: false
# frozen_string_literal: true

class Eyep < Formula
  desc "Inspect geographical and network details for an IP address or local machine"
  homepage "https://github.com/ernilambar/eyep"
  url "https://github.com/ernilambar/eyep/releases/download/v1.0.1/eyep"
  sha256 "29dab417b51b695091e51fe95822a54a59b09e7c6396d2f2718d04996c63d5d1"

  depends_on "jq"

  def install
    bin.install "eyep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eyep --version")
  end
end
