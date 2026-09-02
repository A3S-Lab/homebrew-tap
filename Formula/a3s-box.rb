class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.3/a3s-box-v3.2.3-macos-arm64.tar.gz"
      sha256 "32bdea6add8f5a8353af0571e89aee31d928ac372357318cf54ef0998a4e08cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.3/a3s-box-v3.2.3-linux-arm64.tar.gz"
      sha256 "d0b1bd54521417c05d123f296ab98e37341f2701b753fd7a96ff633a16a27bb0"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.3/a3s-box-v3.2.3-linux-x86_64.tar.gz"
      sha256 "bea9ecbe854b3758be29bf1677b68551ebcd4879f1a8e5b5005eb868eaae1911"
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
