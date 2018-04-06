class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.0.9/sd_0.0.9_Darwin_x86_64.tar.gz"
  version "0.0.9"
  sha256 "2824d537447a844398a4276409b4d3f2b458a09a5a8ee306f7d045040cae9b09"

  def install
    bin.install "sd"
  end
end
