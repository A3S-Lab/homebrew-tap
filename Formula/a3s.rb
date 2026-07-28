class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/a3s"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "a3s-lab/tap/a3s-webview"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/a3s/releases/download/v0.11.0/a3s-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "9561c97a6025d8396074286887125c797ece530383168aefdc298aba38fe47f0"
    end
    on_intel do
      url "https://github.com/A3S-Lab/a3s/releases/download/v0.11.0/a3s-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "05e7ece5141b7344397b5c72e1950cb48f29857f48022a3394bb54f5dd492a3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/a3s/releases/download/v0.11.0/a3s-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0fd79b013243e8612d4710e5debb8255f9483dcc6ffdd26a5ced8acd8c853750"
    end
    on_intel do
      url "https://github.com/A3S-Lab/a3s/releases/download/v0.11.0/a3s-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "846bcf9605152a1ada9b735dfeed31d08bcdec9ff86363f689e753d8bd8fcad3"
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
