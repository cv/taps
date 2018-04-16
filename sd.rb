class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.1.9/sd_0.1.9_Darwin_x86_64.tar.gz"
  version "0.1.9"
  sha256 "10f8c098c40566f8ac95bb36c98276ba2b61fa13216246ed42dbe6a8ed4e330d"

  def install
    bin.install "sd"
  end
end
