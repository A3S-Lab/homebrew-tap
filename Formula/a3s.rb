class A3s < Formula
  desc "A3S coding agent CLI — `a3s code` launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.12/a3s-v0.5.12-aarch64-apple-darwin.tar.gz"
      sha256 "f9dabfdfa4f8b3b74ca68822f302ed38f0f384d668a820a0b4cd5e7c2272aa3f"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.12/a3s-v0.5.12-x86_64-apple-darwin.tar.gz"
      sha256 "fb628ac26a6d2275935e546d6dc9c57c50fc7cd40c8c8253d51444ddd6bc4e0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.12/a3s-v0.5.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac9d60c68dd6e684e6437e6bf646efc264d78a09e2242401a3230b6a4fdd786a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.12/a3s-v0.5.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ac25a5a6bc635b338412e34bdedc93de1379d0dff61e6b4883939ce87a2ecd8"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
