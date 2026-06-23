class A3s < Formula
  desc "A3S coding agent CLI — `a3s code` launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.4/a3s-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "2c94ee58d84fc7b48e57af7e34c082efbec0d4884c564f9277679ce78405af8c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.4/a3s-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "8d91c5d783e25c58b572d359623ab35740310f51809e076c812bbd3887571fdc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.4/a3s-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "19e21b60514ec149c22ea56ac55a5a5ab3b08527231d7f5e7f1598918b22eb40"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.4/a3s-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63773ed476cc419345b2187399ba9c121edab401fb5d0cedb61c51ad74147271"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
