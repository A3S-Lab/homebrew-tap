class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.11/a3s-v0.5.11-aarch64-apple-darwin.tar.gz"
      sha256 "63d91ac37ea68015996dd9f8510687ce076f3a750404a216443aedc77340bf4c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.11/a3s-v0.5.11-x86_64-apple-darwin.tar.gz"
      sha256 "570e3c8c342f46895fc80851ab1c0984f32f05143398bf138975410957f48858"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.11/a3s-v0.5.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "873beebf6db4f191acd67cdb981d69717ca6adf0905ad688d9d1a6a785e3775b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.11/a3s-v0.5.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8776272e462410a3db138fd4f7adc763f1275d443db1f2bcdb55ba9165ec6e4c"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
