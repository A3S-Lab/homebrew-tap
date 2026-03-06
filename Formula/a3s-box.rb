class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-macos-arm64.tar.gz"
      sha256 "5dc60f4f9a1ede91f5ebaf3d70038cef37ce3f57721b76cfcec98f5c1b696829"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-linux-arm64.tar.gz"
      sha256 "eee4bf8f5dcbce0d0207111b99b0cbdf5eb4f733440ec21081fdbb3650d6f7fa"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-linux-x86_64.tar.gz"
      sha256 "601c9e543dadd6499496cc6adbc6d003e2a3f5f279bc0051808f58804b83a928"
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
