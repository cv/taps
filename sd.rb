class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.2.8/sd_0.2.8_Darwin_x86_64.tar.gz"
  version "0.2.8"
  sha256 "36c10cc55817ecd57c1c29e93883b9cd0f70c6d0be3f53b18c9d64c474cad38c"

  def install
    bin.install "sd"
  end
end
