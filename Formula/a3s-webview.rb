class A3sWebview < Formula
  desc "Native WebView and top-center Agent Island helper for A3S Code"
  homepage "https://github.com/A3S-Lab/WebView"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.2/a3s-webview-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "862c121ac3b5676a59bf85310d54f686ea87eb7a471791be0d5aa6a0f3c35ecb"
    end
    on_intel do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.2/a3s-webview-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "2163047088e7adcd8493e17b82912f9c7cb9952db7ed47ad59484faa8b62a7e2"
    end
  end

  on_linux do
    depends_on "webkitgtk"
    on_arm do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.2/a3s-webview-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b1b7dda5e3332947952201fb8c116010fdddd4a47b8883b0604db0c75615f7d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/WebView/releases/download/v0.1.2/a3s-webview-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2197ef3b0ea9baad4eddfcae00d0ea2d5ecd4fa5f1385dbba29594af234bf3d8"
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
