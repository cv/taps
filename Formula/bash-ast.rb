class BashAst < Formula
  desc "Parse bash scripts to JSON AST using GNU Bash's actual parser"
  homepage "https://github.com/cv/bash-ast"
  url "https://github.com/cv/bash-ast.git",
      tag:      "v0.2.15",
      revision: "d2ebc14b57c4011738e050febc97ce6522d13269"
  license "GPL-3.0-only"
  bottle do
    root_url "https://github.com/cv/bash-ast/releases/download/v0.2.15"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2d0c9cb7c35052981d06dd6380e465a13ddd330c0f445f3ada6ce1a975a4f17e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e92e85afc207a5d48e1e34560c7d70cecd318e01c6199baa6cb26f8c89474ce6"
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
