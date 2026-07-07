class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.7.1"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.1/a3s-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "ec250f1dd20064775d5a16eace61eea22955e6987129d84e7708af2ad6feb0d8"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.1/a3s-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "af3b7d409eba19431957d774899e6bf2f6bcc73e0c9a89bff2dd8b324421e7b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.1/a3s-v0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a84d3d613b781e8c0b9b27f9af3204d5d036444ecd541c279bc5e7e875013141"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.1/a3s-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "073ce29d75c9db691202bcfd3ba38eac4ddf8505e0f197f9b8fcb0a15cf00b80"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
