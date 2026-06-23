class A3s < Formula
  desc "A3S coding agent CLI — `a3s code` launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.5/a3s-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "8f9752a869255d363a1e2a40f834536c94440d41b6b30a0a00295f363a223531"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.5/a3s-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "0ce6c3f442ecdd0ffa1a18a3b8af22d32a81d08f9b6ea73759dc20c5b98f9692"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.5/a3s-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d852a940c6fa90dbefcf502df031a95b09ecdb4eefe66417910b75a77437b82"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.5/a3s-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c8df8dd1ed2ef000ed5e5ff6073681837e05f38e823f9ee0a559cfce35a0ccf"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
