class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.0.7/sd_0.0.7_Darwin_x86_64.tar.gz"
  version "0.0.7"
  sha256 "04701a29ed66e770577d26f06af2559926b85d6deaed6f2a8362b9d7d41b463a"

  def install
    bin.install "sd"
  end
end
