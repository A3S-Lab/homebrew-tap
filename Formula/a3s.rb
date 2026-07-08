class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.7.6"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.6/a3s-v0.7.6-aarch64-apple-darwin.tar.gz"
      sha256 "3058b004f28ca53f6f82f520972fe134b93ea8e0a0193d8bf9cf54e268551f7c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.6/a3s-v0.7.6-x86_64-apple-darwin.tar.gz"
      sha256 "5d7ba824c544535c36fa41c8314c63d462873715d5f3825d69cde345cbec6d95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.6/a3s-v0.7.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c167232e31bd26fbbcb223d702b7756f60eb9b298401237046fb8e06419d23b5"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.6/a3s-v0.7.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5602abe6ab82b46761e832551056fc1c415f949c21a058b69ec6f019841dff87"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
