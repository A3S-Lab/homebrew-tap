class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.8/a3s-box-v3.0.8-macos-arm64.tar.gz"
      sha256 "d21f1b795fb3c639a3917ca718f1dcac7b338d1733d0ef66c424cbe96ee73878"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.8/a3s-box-v3.0.8-linux-arm64.tar.gz"
      sha256 "9821e124d563e4e6a257430dbada495913771d78a3bf896790cbbe83dd46c04a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.8/a3s-box-v3.0.8-linux-x86_64.tar.gz"
      sha256 "5258535435be623e7cfb638d822cebfff79106c182ae5cf36e22bb1fcaac55f9"
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
