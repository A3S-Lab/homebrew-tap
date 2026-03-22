class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.13/a3s-box-v0.8.13-macos-arm64.tar.gz"
      sha256 "33cdddc0eddfc1410ee905b81fc1ea76b2f0a56f3dfad75cff349928e2545354"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.13/a3s-box-v0.8.13-linux-arm64.tar.gz"
      sha256 "529ce7a28082eda03e01ec44b0015ab59562e752f931df570143a928f43f020f"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.13/a3s-box-v0.8.13-linux-x86_64.tar.gz"
      sha256 "0928a2e42d06d68a186d635f14efd43e9ad968eaab84955efbd334e62d8e0f6c"
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
