class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.9.6"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.6/a3s-v0.9.6-aarch64-apple-darwin.tar.gz"
      sha256 "f22505c4436f064b250172c036feb118084a5555067b560fad65ba284ddc4eab"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.6/a3s-v0.9.6-x86_64-apple-darwin.tar.gz"
      sha256 "13bab9992e54dfe2e73ba122eeb420fac32d9ec7ccfc851c1f6c331bee8715aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.6/a3s-v0.9.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1be9acc28834896e83de1db291ef5e6aa92e0c06c237b2c3f61824579be86166"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.6/a3s-v0.9.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5923f8142278dd27db4a6238a88d82b2fc1f635482aeddfbe8caa70366368fc8"
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
