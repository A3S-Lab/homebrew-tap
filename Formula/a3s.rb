class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.9.8"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.8/a3s-v0.9.8-aarch64-apple-darwin.tar.gz"
      sha256 "2c052f0f23ae116ee3cc181129b2a57a395411f4695cababb79de4c97f594285"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.8/a3s-v0.9.8-x86_64-apple-darwin.tar.gz"
      sha256 "3d7aa39ff2f40370b4fd1f225da2124ccfe25511f08291f897bc4ba35aa4e65b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.8/a3s-v0.9.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be420a077eb3fc19cf54517cbc41e49d02da7b645ba8c4f542246eaa8c040344"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.8/a3s-v0.9.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6dc126142a75ff1c2bebbd35b4531faefede01303c69717c1cde8e3cfd06c10d"
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
