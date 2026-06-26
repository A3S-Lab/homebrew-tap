class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.5/a3s-v0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "209d4ee4be09732cd6c984af4d823b9a7c183d7a91f367d53ef41fdf302522eb"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.5/a3s-v0.5.5-x86_64-apple-darwin.tar.gz"
      sha256 "8c40630642e1929b07cf593c53e398d93dbcd6de9d5c537cbdae0e6b20e682e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.5/a3s-v0.5.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1154491ee6129f19d5327a1a7cba5919218fa818d72748d505894d5503747be8"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.5/a3s-v0.5.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "414e9c9e213983143cc2850466e9aa5160f90d995524aecc387cc6840310bbdc"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
