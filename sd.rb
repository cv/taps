class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.1.5/sd_0.1.5_Darwin_x86_64.tar.gz"
  version "0.1.5"
  sha256 "1aa513c39d21c7b2315b30623e6643265bf5e9de361c8ba4efb72e79b95beb1c"

  def install
    bin.install "sd"
  end
end
