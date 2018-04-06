class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.0.6/sd_0.0.6_Darwin_x86_64.tar.gz"
  version "0.0.6"
  sha256 "5d093cbb45e028e1439945c1b7b61f388d22b31d9c4064b02a979806569c0965"

  def install
    bin.install "sd"
  end
end
