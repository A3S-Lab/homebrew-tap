class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.3/a3s-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "21329c252b765b92af7396364b6294aa83fe92d5c01e4362edf47fc5e731cc8a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.3/a3s-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "58e5a7c66f64eb99c96f71a877c536505a91b1bf96e6797a5b8ccfa0976992f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.3/a3s-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f587c39e0d5c1af4d2f03d51bb4fc19549940fa2570709174823edbd6e896ea4"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.5.3/a3s-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b384c7ab4b848d06d3fe98e41bc7e117094f95c0b011bd35140a3f11236a819d"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
