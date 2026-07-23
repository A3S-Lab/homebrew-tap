class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.10.1"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "node"
  depends_on "ripgrep"
  depends_on "a3s-lab/tap/a3s-webview"

  # Homebrew rewrites Node shebangs during keg cleanup. The managed
  # sandbox payload is integrity-checked byte-for-byte at runtime.
  skip_clean "share/a3s/support"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.1/a3s-v0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "e51ddcd0c0f7e1e5a832c451cddfd43ac1f2166956e76c41dc245a923e070499"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.1/a3s-v0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "67f6648deba58b2dea4c35d0af2c87d4c636f89ed4a67b7655b46362d34f2366"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    depends_on "socat"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.1/a3s-v0.10.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93cc317fd56e8284c02cb86594f73186bd73bc8e6a3c49e57058d3e1db4ea3df"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.1/a3s-v0.10.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b577fc1d6512bc709b62a8e101939d31d614d5efb3719b9b6626cfc3d1b8b0ac"
    end
  end

  def install
    bin.install "a3s"
    pkgshare.install "web", "support"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
    assert_predicate pkgshare/"web/index.html", :exist?
    managed_srt_cli = pkgshare/"support/managed-srt/node_modules"/
                      "@anthropic-ai/sandbox-runtime/dist/cli.js"
    assert_equal "#!/usr/bin/env node", managed_srt_cli.open(&:readline).chomp
  end
end
