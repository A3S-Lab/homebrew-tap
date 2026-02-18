class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.4.0/a3s-box-v0.4.0-macos-arm64.tar.gz"
      sha256 "ceeaa244d986af1b010c3e704487983c143005ac4e8db6a2c477f40006140083"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.4.0/a3s-box-v0.4.0-linux-arm64.tar.gz"
      sha256 "7183bd52a3c6661cb6c6019479212a16572b7e6e936124e994ec923d1c709ba5"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.4.0/a3s-box-v0.4.0-linux-x86_64.tar.gz"
      sha256 "b1ba3394cd5899afa5e99f9ca466e531f017cb9436681b486a0c8c117ec974d2"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
