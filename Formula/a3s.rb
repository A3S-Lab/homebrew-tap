class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.4/a3s-v0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "426ee72e6a28f5aa4fed0171c848c8467ada78d2d6c18f98093cd0a93ce7f8c7"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.4/a3s-v0.5.4-x86_64-apple-darwin.tar.gz"
      sha256 "e6c381496bc7df4c80fb59c7d3fd2b03313b79818659913548c7ec331adc39d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.4/a3s-v0.5.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e2af3998b201840f38d77f4df1606a5a1bf5a1ccec522dde657aebe50991d0a3"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.4/a3s-v0.5.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92003b9e2befa70e5732898cd75758b983c904093311da7af3b3b7c30bcde818"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
