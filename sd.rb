class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.1.3/sd_0.1.3_Darwin_x86_64.tar.gz"
  version "0.1.3"
  sha256 "6eb29d817333346e30c843e8813dad8255ee8f6e2c9c95b983a11d184699645b"

  def install
    bin.install "sd"
  end
end
