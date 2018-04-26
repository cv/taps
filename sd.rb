class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.2.5/sd_0.2.5_Darwin_x86_64.tar.gz"
  version "0.2.5"
  sha256 "66a4f47f4e879a2655461c5d58eec805a02e2cad2d27870d4b5d2f4d3215c643"

  def install
    bin.install "sd"
  end
end
