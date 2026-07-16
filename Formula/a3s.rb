class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.9.2"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.2/a3s-v0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "2465104940bf738c3714e3df22035a03f1ef2b31b095def1882f5c1b800d6fed"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.2/a3s-v0.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "122e6cfb6bbd886d667d5b16d9234fd185c110705065b17b9603fbbdd36e43e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.2/a3s-v0.9.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b28b2947556f69cb46f894005d0ae33fdb14828193570acd337925609f77b0a9"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.2/a3s-v0.9.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b344442538f37df36bf5cd7823399d1d95c7acee9b1bb587da94363f7e73f86e"
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
