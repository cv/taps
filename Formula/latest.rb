class Latest < Formula
  desc "Find the latest version of any command, package, or library"
  homepage "https://github.com/cv/latest"
  version "0.2.8"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cv/latest/releases/download/v0.2.8/latest-aarch64-apple-darwin.tar.xz"
      sha256 "b83f72c5c7a018fda245edbbfc1938690710cbf7d4d8ab484e3fe63c189d3c11"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cv/latest/releases/download/v0.2.8/latest-x86_64-apple-darwin.tar.xz"
      sha256 "698cb51c3082735638a58de64687b8606ce8077caa11daf6aaba89e97fc36cb4"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cv/latest/releases/download/v0.2.8/latest-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9ab6eaafca4a87578525cd77085a27a2264cce699a0a19cc994eaecde539ad7a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cv/latest/releases/download/v0.2.8/latest-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a84fe8bdc986484a8b4fa1cdf9d0b9ac4d5c812f600b3d021f87cebd0d59f6cb"
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
