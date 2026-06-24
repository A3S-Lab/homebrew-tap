class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.3.0/a3s-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "97efc2863ea4ae0258ffef7ad8fec60821189719ed1ee3cd1dac2af158030703"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.3.0/a3s-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "3be043a8405b305f6971a8a55e0c370cbcbad271dd5edac631a03ffe6cc7cc26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.3.0/a3s-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d09e0b5841c6cc66222179391af5e42170bed99372f6f5109bf2d3cd01261f71"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.3.0/a3s-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47435bc20bc7c65abfa65d677b21c89d57e30bbd5b6606385c6ff8e8150a779c"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
