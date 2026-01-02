class Sd < Formula
  desc "⚠️ DEPRECATED - Use juanibiapina/tap/sub instead"
  homepage "https://github.com/cv/sd"
  url "https://github.com/cv/sd/releases/download/v0.2.8/sd_0.2.8_Darwin_x86_64.tar.gz"
  version "0.2.8"
  sha256 "36c10cc55817ecd57c1c29e93883b9cd0f70c6d0be3f53b18c9d64c474cad38c"

  deprecate! date: "2026-01-01", because: "is archived; use juanibiapina/tap/sub instead"

  def install
    bin.install "sd"
  end

  def caveats
    <<~EOS
      ⚠️  This project is archived and no longer maintained.

      For a more feature-rich alternative, install:
        brew install juanibiapina/tap/sub

      See https://github.com/juanibiapina/sub for details.
    EOS
  end
end
