class BashAst < Formula
  desc "Parse bash scripts to JSON AST using GNU Bash's actual parser"
  homepage "https://github.com/cv/bash-ast"
  url "https://github.com/cv/bash-ast.git",
      tag:      "v0.2.14",
      revision: "17f402ba7f735b5ccec1e706b0c3bb841e1fb307"
  license "GPL-3.0-only"
  bottle do
    root_url "https://github.com/cv/bash-ast/releases/download/v0.2.14"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6fe376daa272655fd411d1bda9c7feffddada4728e4a450c60f5fd29f8eda55e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d31b8f74e117154ad6c03bc4de0d98589acaa00bcd2b9dd08dcbe5b0b1f541c2"
  end
  head "https://github.com/cv/bash-ast.git", branch: "main"

  depends_on "llvm" => :build
  depends_on "rust" => :build

  def install
    # Ensure LLVM is found by bindgen
    ENV["LLVM_CONFIG_PATH"] = Formula["llvm"].opt_bin/"llvm-config"

    # Initialize and update git submodules (bash source)
    system "git", "submodule", "update", "--init", "--recursive"

    # Set version from formula version (strips 'v' prefix if present)
    inreplace "Cargo.toml", /^version = .*/, "version = \"#{version}\""

    # Build and install the release binary
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Test basic parsing
    output = pipe_output(bin/"bash-ast", "echo hello")
    json = JSON.parse(output)
    assert_equal "simple", json["type"]

    # Test pipeline parsing
    output = pipe_output(bin/"bash-ast", "ls | grep foo")
    json = JSON.parse(output)
    assert_equal "pipeline", json["type"]

    # Test for loop parsing
    output = pipe_output(bin/"bash-ast", "for i in a b c; do echo $i; done")
    json = JSON.parse(output)
    assert_equal "for", json["type"]
    assert_equal "i", json["variable"]
  end
end
