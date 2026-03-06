class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-macos-arm64.tar.gz"
      sha256 "496255c1a67e6c1cec8d9ccf99c05e761eca5bdcfdbb674ae19eca3a945fabe2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-linux-arm64.tar.gz"
      sha256 "589edee271778221d7593d525775ed700b92207a8a7ac64d789c7f68258ca1ad"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-linux-x86_64.tar.gz"
      sha256 "821c1dcb67cb3a31ff51e7a8d8c9d0114ee06e7c49fca4e19fe50ba1b21de865"
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
