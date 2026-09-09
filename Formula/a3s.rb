class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.0/a3s-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "b8a4514df6c35745721e27c06a48426b1f0a1b04775d979e3cc932f2fe0a1589"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.0/a3s-v0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "71f8bb5b51912a537f3da8b78acc8aa73101c59aaeaa3535be8ffda85eb217bb"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.0/a3s-v0.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3fcc69d73577a530f494be73981851bce4ea6672194f47cd5668b9122fef88ae"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.0/a3s-v0.15.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b6918ab4da84f88618cabb460bfea82a228a257438ea42ed10ad84360748c01"
    end
  end

  def install
    bin.install "a3s", "a3s-webview"
    # Keep the target-specific Moli sidecar beside the executable;
    # Code Core discovers bin/moli/moli without a second download.
    bin.install "moli"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
    assert_predicate bin/"moli/moli", :exist?
    assert_match "usage: a3s-webview", shell_output("#{bin}/a3s-webview --help")
  end
end
