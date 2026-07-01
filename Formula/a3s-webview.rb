class A3sWebview < Formula
  desc "Native WebView popup helper for the a3s code TUI (RemoteUI)"
  homepage "https://github.com/A3S-Lab/WebView"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.1/a3s-webview-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "82b69c1da24ece031876a3963ffc70c861837b6787069c3693dc8bd26b35af15"
    end
    on_intel do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.1/a3s-webview-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "39dfd8b78370b61000439cace661156bf0ef3a13772d3d4098dff5a04df16490"
    end
  end

  def install
    bin.install "a3s-webview"
  end

  test do
    assert_match "usage", shell_output("#{bin}/a3s-webview --help")
  end
end
