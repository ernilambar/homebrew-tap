# typed: false
# frozen_string_literal: true

class Eyep < Formula
  desc "Inspect geographical and network details for an IP address or local machine"
  homepage "https://github.com/ernilambar/eyep"
  url "https://github.com/ernilambar/eyep/releases/download/v1.0.0/eyep"
  sha256 "048223a5e128a9ca15d9bfe8552988303cabc69e50e0a89ad14843b98cf6d853"

  depends_on "jq"

  def install
    bin.install "eyep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eyep --version")
  end
end
