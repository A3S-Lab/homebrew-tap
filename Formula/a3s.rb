class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.9.1"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.1/a3s-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "8d31c9d158879aaffcc1c63c1a1c63083696284b546b62bcf63a755de70d6173"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.1/a3s-v0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "f030c5622ddab5148022d7a17198786f66bf09cb150255a3d16685319c6e7ceb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.1/a3s-v0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "698ce2b302d33f9c61edd05b4ea3818fe8078b4f0f56d9353e4b8917fedf37e6"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.1/a3s-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08a4d8de20776311b951c34971466e45aaac81c9632060eabbdcc3cc842eec3b"
    end
  end

  def install
    bin.install "a3s"
    pkgshare.install "web"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
