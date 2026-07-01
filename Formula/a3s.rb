class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.14"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.14/a3s-v0.5.14-aarch64-apple-darwin.tar.gz"
      sha256 "4a75cfc869523524f0de590c3dd0f24c09b10d43290bea68968aa9bee44e6590"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.14/a3s-v0.5.14-x86_64-apple-darwin.tar.gz"
      sha256 "c2080663996c9f5861ac8c2707b607d7e9dfc38bc2a83bde41e07833091e7a7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.14/a3s-v0.5.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c75bfba1fe4e87f3c3db7f28b4e016277990022b2931c6be8cced2bfed5ad5e4"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.14/a3s-v0.5.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8dc7dfc099b1f2516961ee93c7c3a6ab8c0b723329f4baad2522c63da98cc78c"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
