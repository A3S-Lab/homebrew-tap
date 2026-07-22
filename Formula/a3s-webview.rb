class A3sWebview < Formula
  desc "Native WebView and top-center Agent Island helper for A3S Code"
  homepage "https://github.com/A3S-Lab/WebView"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.5/a3s-webview-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "5a39c81912dc259a201d7d6f873ce47a95c5e662665d2a662d4fc58218a9bcd2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.5/a3s-webview-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "16e392d7fced9c92e7f0a91c8dfad17d6fbbaaebcd888d376a33e4e7f00b19a9"
    end
  end

  on_linux do
    depends_on "webkitgtk"
    on_arm do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.5/a3s-webview-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "120417a69b9d4ac418cbf1d71553a9e3b63f09157471f6e2ada7c81268ca5e78"
    end
    on_intel do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.5/a3s-webview-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d69a60641b03cc8cb5dae467a68eebc5f2990ccd576684a5425ccc179a02b052"
    end
  end

  def install
    bin.install "a3s-webview"
  end

  test do
    assert_match "usage", shell_output("#{bin}/a3s-webview --help")
    island = shell_output("#{bin}/a3s-webview --agent-island --help 2>&1", 2)
    assert_match "--snapshot <absolute-path>", island
    assert_match "--lock-file <absolute-path>", island
  end
end
