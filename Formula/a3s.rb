class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.10/a3s-v0.5.10-aarch64-apple-darwin.tar.gz"
      sha256 "b7cbc32e3b786dbd5e1899817e241a96003b104e47c9a0ebdaab798988e7bf0a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.10/a3s-v0.5.10-x86_64-apple-darwin.tar.gz"
      sha256 "d39bbebe151f801febdd8b817e6801adbec374634df9c85627bb97ef60f30afd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.10/a3s-v0.5.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e9a5f3ed79b4d5a335ce39af463ea18d430176f753ca9393729a86af3b1dae7"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.10/a3s-v0.5.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd83c7a3c865eb0301c988feb30e93c8794a612e9bc6be937f280685786f77ca"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
