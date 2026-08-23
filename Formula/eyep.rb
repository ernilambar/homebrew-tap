# typed: false
# frozen_string_literal: true

class Eyep < Formula
  desc "Inspect geographical and network details for an IP address or local machine"
  homepage "https://github.com/ernilambar/eyep"
  url "https://github.com/ernilambar/eyep/releases/download/v1.0.2/eyep"
  sha256 "bc30ad16198a354f4eebaff960a0536faf00f0c5bba72ed4f89c381a5cda84db"

  depends_on "jq"

  def install
    bin.install "eyep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eyep --version")
  end
end
