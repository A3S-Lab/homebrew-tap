class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.1.0/a3s-box-v2.1.0-macos-arm64.tar.gz"
      sha256 "36b1479128e06202cf4667d09ef496155c1a1f6de7318a7754b36b5fd74236ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.1.0/a3s-box-v2.1.0-linux-arm64.tar.gz"
      sha256 "6b6535c139571e5f0d674e3c96444a4473946a63b32849ab6db69b1fd79aa6e0"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.1.0/a3s-box-v2.1.0-linux-x86_64.tar.gz"
      sha256 "6159c3abcf69834c5472a2ae09040b51b2f101423f1d46bb6c2889b7139a201c"
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
