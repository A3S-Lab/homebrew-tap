class A3sWebview < Formula
  desc "Native WebView and top-center Agent Island helper for A3S Code"
  homepage "https://github.com/A3S-Lab/WebView"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.3/a3s-webview-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "0dc6387e31f583c56fcdf31f09e6e687346b9e9f7663ac12a500f5ed5b7e60d3"
    end
    on_intel do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.3/a3s-webview-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "5d52564c607c8104e01329ce48cb0adc102fef4a72d71c693c3760849301a8cb"
    end
  end

  on_linux do
    depends_on "webkitgtk"
    on_arm do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.3/a3s-webview-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f53b4d41351942b04c007a6c4f2b3096cde66e9c8846f1ccb74a944d42e6df0"
    end
    on_intel do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.3/a3s-webview-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2acc8c8e12a81f0986283db57208a4210db9fca154502f029fb5d7f5ac5147ef"
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
