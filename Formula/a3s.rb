class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.7/a3s-v0.5.7-aarch64-apple-darwin.tar.gz"
      sha256 "d350a49dd91f95331760c4740f9f3a02f750645fa48a0c466cf11fae51d75ba8"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.7/a3s-v0.5.7-x86_64-apple-darwin.tar.gz"
      sha256 "d5d6ed835840d5b5ad3e4d912e913943dff137c8e77e377a5e42bfdc8371de9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.7/a3s-v0.5.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a6f98f83c6519b3a9135cca60d7f0745d581d0e99c59cbb6d80e87015110460"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.7/a3s-v0.5.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9824145dfe1e01b847397c4fbfdbf79831fa5077f0744ed0e706f29c81c6eec6"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
