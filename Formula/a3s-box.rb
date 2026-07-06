class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.1/a3s-box-v3.0.1-macos-arm64.tar.gz"
      sha256 "76e8d1157dbbc6491811acd22a59e178b50c5ba42c03378d0226b130c1d5a808"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.1/a3s-box-v3.0.1-linux-arm64.tar.gz"
      sha256 "61232c06c74f7beb6dee74457b10e8e48e8eed782b68f4b6692deebbae777f42"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.1/a3s-box-v3.0.1-linux-x86_64.tar.gz"
      sha256 "251777f791bc65c98d2ee8913d47fc8e7df391e27508203017e01160654a1848"
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
