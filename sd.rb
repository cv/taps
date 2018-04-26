class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.2.6/sd_0.2.6_Darwin_x86_64.tar.gz"
  version "0.2.6"
  sha256 "ae072702746a656aa59bdb9d49cbe3b656e723653062450b511295320c39a7d0"

  def install
    bin.install "sd"
  end
end
