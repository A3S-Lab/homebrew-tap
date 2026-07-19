class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.9.7"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.7/a3s-v0.9.7-aarch64-apple-darwin.tar.gz"
      sha256 "3f29c1f62707fe498d464f6f79e703e6509f04b4dd246b078a41489375e3e090"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.7/a3s-v0.9.7-x86_64-apple-darwin.tar.gz"
      sha256 "9a353db572a791bee5e8296da5b01c9398c90ef8da112ba8a43d4e81a9c65d50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.7/a3s-v0.9.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cdac1af9ae986f03641121b19538dbd139ed66dc1f55ee820608ba47eac42d82"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.7/a3s-v0.9.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed362ec3156283655e25c5d02e102ab3f416db4b1f0e3827f5f626bbbddfa09e"
    end
  end

  def install
    bin.install "a3s"
    pkgshare.install "web"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
    assert_predicate pkgshare/"web/index.html", :exist?
  end
end
