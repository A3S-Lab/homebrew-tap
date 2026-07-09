class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.7.8"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.8/a3s-v0.7.8-aarch64-apple-darwin.tar.gz"
      sha256 "c97e8a2455be7602a1251a1dd6bf659842e8ce57feb0d36f8e0e8d3a5034ca8e"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.8/a3s-v0.7.8-x86_64-apple-darwin.tar.gz"
      sha256 "68a27e2120098b20ff9b4607aa03acf21a89bc2802b62f3eb739418a86de590b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.8/a3s-v0.7.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5757a0b085194fd7300bb9b3ff1db997281ae6349336d50c655d2ba7f4cb17dc"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.8/a3s-v0.7.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fdc2ff362010fba29013033ab0b6f7224630fb17bd254bac94ef5368cdbaf12d"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
