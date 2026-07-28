class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "a3s-lab/tap/a3s-webview"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.12/a3s-v0.10.12-aarch64-apple-darwin.tar.gz"
      sha256 "509c21166690d11b6814e95d5825cfb7538972337d1fb75d05695dfcbb37dcf3"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.12/a3s-v0.10.12-x86_64-apple-darwin.tar.gz"
      sha256 "913a1bf7389e95c62124f7f1ece2195d9467fab371b0be88b49a327a14fd99e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.12/a3s-v0.10.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb7b2d8b9e1d48a45b14218c0b00836f40459ecd49dc60bb5a8dd05322fc5317"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.12/a3s-v0.10.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "293e3eae433dc2f6052bfdb849028b8092c20ea57280a1bf423c6fe4107804dc"
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
