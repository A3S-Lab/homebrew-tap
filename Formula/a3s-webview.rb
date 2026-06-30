class A3sWebview < Formula
  desc "Native WebView popup helper for the a3s code TUI (RemoteUI)"
  homepage "https://github.com/A3S-Lab/WebView"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.0/a3s-webview-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "75e4a8ca8a1dd3961257841badd63c8f144a3eac1e20aa03f157c65148b3a462"
    end
    on_intel do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.0/a3s-webview-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "931bd66aadb16f25a1e97b77ae8a374248204c2e349f9cd51b17df07f8d95827"
    end
  end

  def install
    bin.install "a3s-webview"
  end

  test do
    assert_match "usage", shell_output("#{bin}/a3s-webview --help")
  end
end
