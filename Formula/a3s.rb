class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.6/a3s-v0.5.6-aarch64-apple-darwin.tar.gz"
      sha256 "01abc95205d455bdcc9598b72fd0193b642f0e1c2ab3e4b7531aa62025c6676f"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.6/a3s-v0.5.6-x86_64-apple-darwin.tar.gz"
      sha256 "8370458c6774b4b513d84d0392147a880cc3b9bf7c6b4ceab413e88971f91971"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.6/a3s-v0.5.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "527ec5e72b0f30480c5d257d35f023cd7674daba2da914d996bfb17f3e8b4389"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.6/a3s-v0.5.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7dc3eab8e86bff617d497d79d3e6a977494d24a9a636373a32d25f49e68f9070"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
