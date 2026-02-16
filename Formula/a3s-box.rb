class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-macos-arm64.tar.gz"
      sha256 "0ce1c0e5f28ddb507a657e38e2b4146819174ae72fbf9ea4386967f128ecfbdc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-linux-arm64.tar.gz"
      sha256 "968ba26dda8f35732fd8f035e00b2eda75b71e4bf74689ad4f8f6b2c32ccac69"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-linux-x86_64.tar.gz"
      sha256 "45a708ca2aa8551f9b02edc33aa00b592969b9fdbbd92679f78321d09f322164"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-box-nsexec"
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
