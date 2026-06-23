class A3s < Formula
  desc "A3S coding agent CLI — `a3s code` launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.3/a3s-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "11fd2212ca2586430825a1a45db5decfa0e39050ade4ec4645b0405be8d2223d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.3/a3s-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "60abf87c926f0d4efec7a931686abc8aa2aa15c88064eae1e2b2a9ab3fd53191"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.3/a3s-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f71fb7f38cad5d15718bd482370f4761ac5ef55f132f3e20dbf9ccd66604133"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.3/a3s-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c1734b0a7651a2cf01dd099be2493c4c321acdf1feb08730c0067d6a577f0c1"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
