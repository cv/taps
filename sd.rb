class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.0.5/sd_0.0.5_Darwin_x86_64.tar.gz"
  version "0.0.5"
  sha256 "1805fe4c7098f95df9600952b15b81b8e382edf4d651c6a7e3725c322865a2d4"

  def install
    bin.install "sd"
  end
end
