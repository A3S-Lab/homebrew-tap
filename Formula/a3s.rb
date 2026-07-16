class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.9.3"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.3/a3s-v0.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "55576bcc254355debbd3735aa42dde62beeabcd869e2893a5968f9e427026e8b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.3/a3s-v0.9.3-x86_64-apple-darwin.tar.gz"
      sha256 "a466226f6d7efc067d26e999f057997000c3b27aa2d622d0a34a235cc126d5c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.3/a3s-v0.9.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "96cc174e143ee632ab06c634459d5ddea59b9fe831369e898a5d6bae0df3fb30"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.3/a3s-v0.9.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d16d52b0d79c2f9bef2f4349b0f7381e3da008d2c1255fe1a2f2d38626d8fda"
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
