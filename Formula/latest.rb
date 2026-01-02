class Latest < Formula
  desc "Find the latest version of any command, package, or library"
  homepage "https://github.com/cv/latest"
  version "0.2.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cv/latest/releases/download/v0.2.4/latest-aarch64-apple-darwin.tar.xz"
      sha256 "5e7665d5ec5d68a435a7db0ee07a39d89b0a011368ef51e0255d62ecca17a38e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cv/latest/releases/download/v0.2.4/latest-x86_64-apple-darwin.tar.xz"
      sha256 "0081a7e3375f6a9bcf1e6db28cc8c51f87a4b73800703dd0cf883f4f5f7cb78d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cv/latest/releases/download/v0.2.4/latest-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7181650f9660389bdfbd25aa4620e24891f0ef23d7c3a7676d3f0af808fc4c16"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cv/latest/releases/download/v0.2.4/latest-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "15fd8fcda8e2ae850c326c2836452ef2424160b87fa4dcebc85bffbf224df0c2"
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
