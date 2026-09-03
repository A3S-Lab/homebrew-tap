class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "a3s-lab/tap/a3s-webview"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.14.0/a3s-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "545abacadc9ae22150a2b0944ec7865ab19b9dc965049c14364be8fcf16e2e4f"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.14.0/a3s-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "a54a42600ed37e5b2dd480e34ebb51233400d84d5fc75129a8c645e26ab91e0b"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.14.0/a3s-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "635b16128a275fc5cc937a99bdfa7c970a86bcb0169ae096d2be055ee4c08a76"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.14.0/a3s-v0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd6877f803dd1bed4d05e7541af75182cc685fe387e2e8ddbce67c8ce4f0cfb0"
    end
  end

  def install
    bin.install "a3s"
    # Keep the target-specific Moli sidecar beside the executable;
    # Code Core discovers bin/moli/moli without a second download.
    bin.install "moli"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
    assert_predicate bin/"moli/moli", :exist?
  end
end
