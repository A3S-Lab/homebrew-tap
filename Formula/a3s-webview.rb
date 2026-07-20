class A3sWebview < Formula
  desc "Native WebView and top-center Agent Island helper for A3S Code"
  homepage "https://github.com/A3S-Lab/WebView"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.4/a3s-webview-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "7a847653d8b96655da79cc9e806ac04fbf3a2ff3dbfa10a570cfa34fb5af84e1"
    end
    on_intel do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.4/a3s-webview-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "8afd49f6a1edde2cf7aaff946a034786d2143ce2ee516b1bb5884dd2c2a54037"
    end
  end

  on_linux do
    depends_on "webkitgtk"
    on_arm do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.4/a3s-webview-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0655b653d70ff2bd66a29279334a05d31d33f701bb05debcc41909c6c17e1d64"
    end
    on_intel do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.4/a3s-webview-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f59dd52e2a39a23d1c4f82f029bf372a142a7288c0d5a3b8d20d1dcc412abc23"
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
