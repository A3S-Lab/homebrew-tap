class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.8/a3s-v0.5.8-aarch64-apple-darwin.tar.gz"
      sha256 "62fe58d6878b7dfe7a1a0c0172284655977eb4c653b49f6de7195d56db00949d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.8/a3s-v0.5.8-x86_64-apple-darwin.tar.gz"
      sha256 "484c2dc5162feec1774fc296a51802eb88425ad46277f5ea39ad3c3e6e7629a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.8/a3s-v0.5.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8608b7a107b51753bd6edfe63b64c9d6f56954d98bf638a423524483088f51c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.8/a3s-v0.5.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9902a4ae265003f38b1ae1a60f15728a127a210b2b66b39f4c810bbb991a0e03"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
