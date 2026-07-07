class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.7.3"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.3/a3s-v0.7.3-aarch64-apple-darwin.tar.gz"
      sha256 "edd7b58020e97f20efe51f003a34866a24432e992b08ff2da603420105cf482b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.3/a3s-v0.7.3-x86_64-apple-darwin.tar.gz"
      sha256 "b5787550f860da98ea398737b6993d2f7831e21bccb06ac07e89d97ff7c033e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.3/a3s-v0.7.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e6a429eeac9da8129fe7ef88dc5bbf8d7a7370ff272027a7b3118ce268f1a95"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.3/a3s-v0.7.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a269caf6a0bc8bab4ab1c8df462d1287a488a55cb2c5ec4aa6dd70ce080ff08f"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
