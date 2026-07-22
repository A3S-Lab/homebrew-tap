class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.10.0"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "node"
  depends_on "ripgrep"
  depends_on "a3s-lab/tap/a3s-webview"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.0/a3s-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "5eff99f5b8a873c525a4e0bbf62501ef786598f4a1908486d1faf34dbb38f94c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.0/a3s-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "dfde21f97f3528d1f55156989c62999403f62e9f159113ea3d54a34cb2ac02d4"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    depends_on "socat"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.0/a3s-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0fcec83ee383b3096b5d69e7355e37639fce5af2234782e9114229ee92ccdf1d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.0/a3s-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31062aff0f388964ed2b8e9944e563ff1e0a85503b94b5cf0731504c4791b848"
    end
  end

  def install
    bin.install "a3s"
    pkgshare.install "web", "support"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
    assert_predicate pkgshare/"web/index.html", :exist?
  end
end
