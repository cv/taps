class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.0.8/sd_0.0.8_Darwin_x86_64.tar.gz"
  version "0.0.8"
  sha256 "48a24dea44f17bfca5a562f25b0171c4e8807c041c26bb7149c55259fd8c1dcd"

  def install
    bin.install "sd"
  end
end
