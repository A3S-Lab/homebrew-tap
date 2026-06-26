class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.2/a3s-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "534e951641b0817c3db940e69af70e58f18372ae4a65c12d247d4bebe14db232"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.2/a3s-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "0aa6fc385af49c8ce51c1cb04c19e8a0ad8e88d311fc714efc0c9d969b3c6845"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.2/a3s-v0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a684774e63d9295bf16fab5d89b287a9cd119107137fb63299ff6f671f191c15"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.2/a3s-v0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "921061447abe7486edf46d976c526d7c16269c534e7a1d206c78d53f756b97f2"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
