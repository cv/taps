class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.1.6/sd_0.1.6_Darwin_x86_64.tar.gz"
  version "0.1.6"
  sha256 "1ca837af0faecb257a20ac4fac365de417e283cc790b14d294ddfd6acc1a4221"

  def install
    bin.install "sd"
  end
end
