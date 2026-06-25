class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.1/a3s-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "8da76c1e042e226574a502d625f2ecf513e4eccf06b2dcb842ab5214230e4b26"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.1/a3s-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "0f197579a14f6934600ff35ff1e6e9fc043ceb501971563cb7ed295f57cc5db7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.1/a3s-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67a0f3767cbbbd05091bc4d9f0a1a31d4857f311a1df3f2b2f20cb53e90b90e4"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.1/a3s-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85347c04c0f29c28633d784f6b58310982af2fdd9975e3ea5bbf1065d7e5a803"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
