class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.1/a3s-box-v0.5.1-macos-arm64.tar.gz"
      sha256 "9c87809fbeef602be764a51c8679b3b2490dbc9c415513fdae3f5d5afbed19a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.1/a3s-box-v0.5.1-linux-arm64.tar.gz"
      sha256 "2c3bc0ed489172fcc72f6ff751867236d53a45c9c6a5a174766d21118e913b1e"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.1/a3s-box-v0.5.1-linux-x86_64.tar.gz"
      sha256 "9865b434cec95aa52008d6bb6efad03884f795a7b82b9ea2f2c0025320b99bb2"
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
