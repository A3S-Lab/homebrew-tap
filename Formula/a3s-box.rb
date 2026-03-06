class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-macos-arm64.tar.gz"
      sha256 "4aa119467e4be2215d650849abc8a0a9bc8a30f96526f2f92edff7039919401e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-linux-arm64.tar.gz"
      sha256 "f4451a055b9a0f1917d325d3372ac0e0a68e4d5a282b0d2abe38faecea0b1134"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-linux-x86_64.tar.gz"
      sha256 "b8cfda52083cffed19a042cd20377cf58961bcb7fe427967dd51e8a834673e05"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
    lib.install Dir["lib/*"] if Dir.exist?("lib")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
