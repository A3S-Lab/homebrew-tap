class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.2/a3s-box-v0.5.2-macos-arm64.tar.gz"
      sha256 "e9904a07371b9161032894e85a2c8a05d3695b05d5f6499478f230167c0ae104"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.2/a3s-box-v0.5.2-linux-arm64.tar.gz"
      sha256 "8991daa4bfb3ac8a379a5ce4fa1a8dbb6ec519126d247407236c59c81fb94823"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.2/a3s-box-v0.5.2-linux-x86_64.tar.gz"
      sha256 "e229616a87dc321d0e8465b62600461be0ab7ee7da7ca927d9f34c6bd686472c"
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
