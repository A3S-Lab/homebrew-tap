class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-macos-arm64.tar.gz"
      sha256 "48e8bfef6631c0106dadd713ea704968510f82cd3725cc831fe48c9ca8391c0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-linux-arm64.tar.gz"
      sha256 "d085a5aea03819877f2e62a4d41a25eb6e6bc46d325d39d7ce257faf211b2f4a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-linux-x86_64.tar.gz"
      sha256 "fc16858392ecc0d483d9e987dfd4fb21ed06c47ac163e2dafbb12b6fd8981860"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-box-nsexec"
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
