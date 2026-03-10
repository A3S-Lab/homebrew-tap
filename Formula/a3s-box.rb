class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.3/a3s-box-v0.8.3-macos-arm64.tar.gz"
      sha256 "0e3eb93e8e6fc1a04333ec6f50df9d2818753ba220cd734fb397475c78c3e922"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.3/a3s-box-v0.8.3-linux-arm64.tar.gz"
      sha256 "e4593ac9ab2dc628259932bd8189b73899ebc77446192eed39070dfeb424d675"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.3/a3s-box-v0.8.3-linux-x86_64.tar.gz"
      sha256 "169de20927451b2d9a32e2a8fb26284c6e0db25013f95fe9c7de7b9ca7aac82f"
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
