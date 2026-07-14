class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.8.1"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.1/a3s-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "a545bca9e273283adfdb2846d94144e4d53f970a9d2a5a0b129480a91489aa73"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.1/a3s-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "95fcacb40ac3995ca793bcb4344f60cc182e108660be6afca46a0fa149dade34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.1/a3s-v0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df103cf019cdce79521459baae45c9b64546e0dbe19d204b80301b2789c8037e"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.1/a3s-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "298bfcbc33ddd7a395f1f4f9e954b729519a5044e378f17e098a9299c451b656"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
