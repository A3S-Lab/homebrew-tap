class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.15/a3s-box-v0.8.15-macos-arm64.tar.gz"
      sha256 "45011ecc9f9ce55d2508a9ef2799aacb06d736249ded51051f0c7c6251d71d02"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.15/a3s-box-v0.8.15-linux-arm64.tar.gz"
      sha256 "02d729b3b79d6156d0da1ea5d6660e51c4652e46a9ff7079a5bf81eb0781eb77"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.15/a3s-box-v0.8.15-linux-x86_64.tar.gz"
      sha256 "63c2cfba9f2e8628bd3875e44652cd6ab53d3e577884c5508fd809256f15cf21"
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
