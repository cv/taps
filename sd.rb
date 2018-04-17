class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.2.1/sd_0.2.1_Darwin_x86_64.tar.gz"
  version "0.2.1"
  sha256 "45d0c566fddd2a6303eeea0a671be94426fbdb1e521b32ad2c02a6648f7fb6ed"

  def install
    bin.install "sd"
  end
end
