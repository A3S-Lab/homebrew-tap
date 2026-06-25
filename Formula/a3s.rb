class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.4.0/a3s-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "789dafb9454d5c892faec5593028ed27ac600f62a2af6dcfbd92d4f3cccc7ba6"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.4.0/a3s-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "60daa6c7e552fcad4b834acdf9b1ed8efddc129898a852a465a98be201edc525"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.4.0/a3s-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dda3c3ad56d9c1a938c626abf9984c4008157decd585950703f25223318280bd"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.4.0/a3s-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d7437e1186e092dfa83eba5f08d62a2197cd9bd3288e9dbf582390ff9cda597"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
