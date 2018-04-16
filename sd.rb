class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.1.8/sd_0.1.8_Darwin_x86_64.tar.gz"
  version "0.1.8"
  sha256 "fb38c433a40af7876a1f3fe4e6cf42c345b305ef9f95d628e34e18ce47e0d1f0"

  def install
    bin.install "sd"
  end
end
