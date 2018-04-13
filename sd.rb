class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.1.7/sd_0.1.7_Darwin_x86_64.tar.gz"
  version "0.1.7"
  sha256 "cff9f71207f8ff74aa2b6c6a777b2e19cea014ee0f1c5f3ac84218a312133045"

  def install
    bin.install "sd"
  end
end
