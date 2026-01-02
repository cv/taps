class Latest < Formula
  desc "Find the latest version of any command, package, or library"
  homepage "https://github.com/cv/latest"
  version "0.2.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cv/latest/releases/download/v0.2.3/latest-aarch64-apple-darwin.tar.xz"
      sha256 "e9f4f51639ac75e1b08e719f20590c7c6aa048fa9dd582ccbc6ffa9c5374f04b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cv/latest/releases/download/v0.2.3/latest-x86_64-apple-darwin.tar.xz"
      sha256 "ff27e0aa731ee7a039b7d99a87b8c44d04cd2df8d95b1c9e0ffd8b00dbc51734"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cv/latest/releases/download/v0.2.3/latest-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d398a634cae4072e46fa1536a3bd10befed00530b123e1fbda7a656253d10583"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cv/latest/releases/download/v0.2.3/latest-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1bfc31af3e7957c0498b881e88545a545cd9deeafa9abf65a1c13b240e118d9a"
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
