class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.9.4"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.4/a3s-v0.9.4-aarch64-apple-darwin.tar.gz"
      sha256 "92788660e9f00e8b21dedcdd8d0a9258f0fd8914311a41e5165d6390320910f2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.4/a3s-v0.9.4-x86_64-apple-darwin.tar.gz"
      sha256 "1dc4e8cdcfac73338e26778e3de2a68a7bc3998ea5f3b3e7816927fcbaf7b9de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.4/a3s-v0.9.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7327172e0f7106902010f2672f8f12875a605b9a9f95104d6869eb434b3ff99f"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.4/a3s-v0.9.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d453bb38a102ff2f48c6892abc9830fda56cb3e1b0f1ea38c351a0fe98d70263"
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
