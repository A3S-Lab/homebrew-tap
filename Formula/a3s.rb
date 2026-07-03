class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.6.0/a3s-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "5443ae7ad9ad4d5870a62e5c56c9aadfb653860b892118ca96493bce57f86b5f"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.6.0/a3s-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "b414e15da17933a426af3f6be6a7c38bd4dbcb1e556700b129b20d50a96636d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.6.0/a3s-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d04c0b2b7ceef1407ccacc0426f38966b6a10638cffae42d376e29c8c34f80f7"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.6.0/a3s-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84774f472cdc185287ea86343b3f24977afcca7ae6a61c5e0935c247093f5372"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
