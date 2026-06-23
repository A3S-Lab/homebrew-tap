class A3s < Formula
  desc "Umbrella CLI for the A3S platform (dispatches a3s <tool> to a3s-<tool>)"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.1.4/a3s-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "7f7a34b675c626b99ee0a30fafd966bd49b920e628ef96ce40db297da4fd1450"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.1.4/a3s-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "dacbfa484e2ee715d226b3aed01a466e8139243d65114f6bad86f88573bb7cbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.1.4/a3s-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "345d4f1cebeb74d5556aee8e9da85ced0a3f973b12c4631d795b072aff1d110c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.1.4/a3s-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c69f47fc45aa4bda04558a03279c61ba3d95690c3b37c95c02a6aae3f25acb95"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
