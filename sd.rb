class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.1.4/sd_0.1.4_Darwin_x86_64.tar.gz"
  version "0.1.4"
  sha256 "f0b24afc66df94837bffcafe95491c7b773b65ef61e96dbf2ceed619c2c7a830"

  def install
    bin.install "sd"
  end
end
