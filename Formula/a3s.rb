class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.9.5"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.5/a3s-v0.9.5-aarch64-apple-darwin.tar.gz"
      sha256 "6932b19f0eaf275987974ef45602a25e0f00f98e440f129f675bb483fdc7d07b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.5/a3s-v0.9.5-x86_64-apple-darwin.tar.gz"
      sha256 "21a13a275c6f1b117045a1f0e38e51684c5a2ade5501659f54bac4bb4b96bc9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.5/a3s-v0.9.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f60be2b6804da6dbe63320859d5298e4c5287aa10a61d5af0d186891bc354ac3"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.9.5/a3s-v0.9.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c0a1d8b34f4f2dc8c186eaf497a62d760d38ccb6014cf4caacfff788269ab43"
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
