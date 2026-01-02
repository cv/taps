class Latest < Formula
  desc "Find the latest version of any command, package, or library"
  homepage "https://github.com/cv/latest"
  version "0.2.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cv/latest/releases/download/v0.2.6/latest-aarch64-apple-darwin.tar.xz"
      sha256 "5a214758e89e4251a8d8efb3867f77a0fa05b9ef304cb2f9133b29c92e982548"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cv/latest/releases/download/v0.2.6/latest-x86_64-apple-darwin.tar.xz"
      sha256 "c1b87999435377f57ad2106e8ff1b46924595a0c9b48e10a1137ea8e61c9120f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cv/latest/releases/download/v0.2.6/latest-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9db0778c45ae939d5559497fb7428a1403a348c73f5c3dba0852b7b334e9f84f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cv/latest/releases/download/v0.2.6/latest-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f06bce2fa6c6ea6e67d87dd31f02b66f47559f2e8026d61120bd783dd03369c1"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-pc-windows-gnu": {},
    "x86_64-unknown-linux-gnu": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "latest"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "latest"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "latest"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "latest"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
