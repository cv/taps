class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.2.7/sd_0.2.7_Darwin_x86_64.tar.gz"
  version "0.2.7"
  sha256 "bd485e7cc8758ab3798d1058df9effa6fc14b782e4749f9370711c70859830d4"

  def install
    bin.install "sd"
  end
end
