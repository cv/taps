class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.1.0/sd_0.1.0_Darwin_x86_64.tar.gz"
  version "0.1.0"
  sha256 "d1f394c8135caaaf335f65a58f98a7dec06fd28ba7490131809d8274d11ba731"

  def install
    bin.install "sd"
  end
end
