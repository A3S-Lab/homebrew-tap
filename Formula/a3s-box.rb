class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.0.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.11/a3s-box-v3.0.11-macos-arm64.tar.gz"
      sha256 "eeaa25074a376a42a5690a9727ebe008c0ed61c17a4be08a560b9928eb31b250"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.11/a3s-box-v3.0.11-linux-arm64.tar.gz"
      sha256 "3b9e7c8f4ea38b2e8cd6cc05db957bfc1fc8d9da844e66251ae1496c58fd1ffe"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.11/a3s-box-v3.0.11-linux-x86_64.tar.gz"
      sha256 "816d83ef27ec79fc053cb0700004f2fbc74ffad1f613e14d8cd80f95b533fec7"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
    bin.install "a3s-box-e2b" if File.exist?("a3s-box-e2b")
    lib.install Dir["lib/*"] if Dir.exist?("lib")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
