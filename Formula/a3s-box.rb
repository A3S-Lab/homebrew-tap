class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.4/a3s-box-v3.0.4-macos-arm64.tar.gz"
      sha256 "1e7ed733ea3e2bb1e6dcd93a51fcea28adefa17f7b52e0373ad39a0318075bd8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.4/a3s-box-v3.0.4-linux-arm64.tar.gz"
      sha256 "40c5b37a36004ddf7137e655528d23e76ae319e1ee5dac2b199648bd957babb6"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.4/a3s-box-v3.0.4-linux-x86_64.tar.gz"
      sha256 "4ee6bd495274938e4ebedad01248c94a3991f0729af4948fedfee35051ce38ca"
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
