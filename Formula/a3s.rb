class A3s < Formula
  desc "A3S coding agent CLI — `a3s code` launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.0/a3s-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "7fcd640499874c51d97cefb7dc047fb6d1997b12a6b0b4355e59f86ec829eb7b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.0/a3s-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "9e6cfaef66124b7dd9373771e753b5750db7ad15f8b7a4d140f939b264c362d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.0/a3s-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80aef7fc0484cae6efd298cc9278ce372baa90731b0ee6b22c2589d2c7851ed1"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.0/a3s-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c673d6208d2366f59c9a9dd06c2622614092dd74c85efbe6f39fd02658a772e0"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
