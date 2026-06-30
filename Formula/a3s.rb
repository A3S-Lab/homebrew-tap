class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.13"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.13/a3s-v0.5.13-aarch64-apple-darwin.tar.gz"
      sha256 "518c7dac29035d0e99d13544d14cd0fac2e61bcc53071e5907cff2b5e8a57e09"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.13/a3s-v0.5.13-x86_64-apple-darwin.tar.gz"
      sha256 "6b3bc26d228d2c68dd9142ccb8c9505bf4c907e96dfca249d57bda0283c10091"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.13/a3s-v0.5.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "641c9f6b73517ddfec6736ddfe76318db2659bed36e6a2c9d9d206fe3fd2901c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.13/a3s-v0.5.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4cb546501cfc88109ab7a7204de4ac990cf48fbc1ba090d505e8f63ad2c6a79c"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
