class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.1.1/sd_0.1.1_Darwin_x86_64.tar.gz"
  version "0.1.1"
  sha256 "852db53a1d6d35f61b594aab99a223d38eb6979b42f39742fd296617a641857d"

  def install
    bin.install "sd"
  end
end
