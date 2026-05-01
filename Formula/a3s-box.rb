class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.3/a3s-box-v2.0.3-macos-arm64.tar.gz"
      sha256 "6aa8d1f4e93a0c002c0698baec3f18d8c4b25cb77e44d0ce2da626eae2adb625"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.3/a3s-box-v2.0.3-linux-arm64.tar.gz"
      sha256 "92d34155045b2a6575121184d5e033adb38dc45e0a62e8f9ca0a88cc490366c7"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.3/a3s-box-v2.0.3-linux-x86_64.tar.gz"
      sha256 "334e756f0931c1c26a0f9a8cff398891274197e3a930ad6b37cdcff6aea43bab"
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
