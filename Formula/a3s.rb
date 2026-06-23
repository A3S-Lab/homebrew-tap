class A3s < Formula
  desc "A3S coding agent CLI — `a3s code` launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.1/a3s-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "e03fdd616cc81c323e701ae2002378473294b0347b5b3b67f17a8022dfa2448a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.1/a3s-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "898c1e663a57ed029a023a88567fe187513438c49239603503aec7f90c0e65f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.1/a3s-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56287965e4d71a5fc78e47c1f09bea3efe713c28089e4b19f1af8620090f6d01"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.1/a3s-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c456d984ca94049e2c160db086efe8f13c695aeae4f93e1fc659779bbdd2b151"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
