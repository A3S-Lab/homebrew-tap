class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/a3s"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "a3s-lab/tap/a3s-webview"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/a3s/releases/download/v0.11.1/a3s-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "32dca5538871c364b6523b47188895208643b837384854d65fda4a8683cebcba"
    end
    on_intel do
      url "https://github.com/A3S-Lab/a3s/releases/download/v0.11.1/a3s-v0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "b53d22b62333dc28744ac03fd6eda12d5689f60571d8077c7879470a7e2d40cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/a3s/releases/download/v0.11.1/a3s-v0.11.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6887954568d45122b093bf1a8c955b8c7310d3b09398b2dc4cce9700533d83e2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/a3s/releases/download/v0.11.1/a3s-v0.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8bd3f01a487be48a7fb8820e9fe79487a49444ffe8efabe6d69f51a33be95b5d"
    end
  end

  def install
    bin.install "a3s"
    pkgshare.install "web"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
    assert_path_exists pkgshare/"web/index.html"
  end
end
