class Sd < Formula
  desc "A tool to keep utility scripts neatly organized."
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.1.2/sd_0.1.2_Darwin_x86_64.tar.gz"
  version "0.1.2"
  sha256 "39ec368125c20a7ac8e782f8b7b86066d6f59d3e004ae8f84620c9a7ffbf342c"

  def install
    bin.install "sd"
  end
end
