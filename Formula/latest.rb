class Latest < Formula
  desc "Find the latest version of any command, package, or library"
  homepage "https://github.com/cv/latest"
  version "0.2.7"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cv/latest/releases/download/v0.2.7/latest-aarch64-apple-darwin.tar.xz"
      sha256 "2cdadd0328ccba8875b2da6391150a8a9ecc8b4933c3f71759878a57de708fad"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cv/latest/releases/download/v0.2.7/latest-x86_64-apple-darwin.tar.xz"
      sha256 "d89373c23347ace39bb630390f748435846e614375481abfea5af3a6305c037f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cv/latest/releases/download/v0.2.7/latest-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a058ed390cabe1b809debf6be2e6336570f010109231d6ebd2010ba0d0a264b7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cv/latest/releases/download/v0.2.7/latest-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cf5fd394218608654c1daac54d01abc9af61dba92150492724d75b3d02951fa7"
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
