class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.10/a3s-box-v0.8.10-macos-arm64.tar.gz"
      sha256 "413388f2e044d060791e2b40a6b0c60990cd3b1dbcb071d8f15db6ceae3e90c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.10/a3s-box-v0.8.10-linux-arm64.tar.gz"
      sha256 "b513486f31a30e26a7b39531bf5ba2029fb9977c29082cd3440ef4678a3e1f53"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.10/a3s-box-v0.8.10-linux-x86_64.tar.gz"
      sha256 "682af14ed81c0370465c438e86849949bed865f33260e13d173b0e6cb37ed079"
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
