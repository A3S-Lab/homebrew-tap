class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.2/a3s-box-v3.2.2-macos-arm64.tar.gz"
      sha256 "54657dd6540b718147765b3f4bc6d43d506b2ec68fbfa085e3d8136e2b0954c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.2/a3s-box-v3.2.2-linux-arm64.tar.gz"
      sha256 "2c21d437ccb93254b8d3f8d798bba3bc631c7bc40da81c8c9b44c63b2f27b364"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.2/a3s-box-v3.2.2-linux-x86_64.tar.gz"
      sha256 "4dda67f1eea0e11b8a4f017f725b07e4ab4566f2cae26eb00519d6967219c561"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-oci" if File.exist?("a3s-oci")
    bin.install "a3s-oci-agent" if File.exist?("a3s-oci-agent")
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
    lib.install Dir["lib/*"] if Dir.exist?("lib")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
