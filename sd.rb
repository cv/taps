class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.2.0/sd_0.2.0_Darwin_x86_64.tar.gz"
  version "0.2.0"
  sha256 "3d13302910673f732b7e35cf79a45c15ed978d7733bb3946d00b4b24199fe9fb"

  def install
    bin.install "sd"
  end
end
