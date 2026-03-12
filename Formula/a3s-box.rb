class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.8/a3s-box-v0.8.8-macos-arm64.tar.gz"
      sha256 "afa7aa60a1e99d8d6c060775b2cfe547bd990388c9b5a617109109b9374e5324"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.8/a3s-box-v0.8.8-linux-arm64.tar.gz"
      sha256 "d08ee84d89c2ce08581d9f018d1d7f8922a1ea07f5be060facc75f83702bc7f6"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.8/a3s-box-v0.8.8-linux-x86_64.tar.gz"
      sha256 "c2107d74bb37416051cddd5da87d92fa505e7ae525bdf5473fc92055764c0b30"
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
