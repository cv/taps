class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.2.2/sd_0.2.2_Darwin_x86_64.tar.gz"
  version "0.2.2"
  sha256 "f611fcca536292fccd93cf44117ed53dc7607711c5e19c4f0dc998b739e613b9"

  def install
    bin.install "sd"
  end
end
