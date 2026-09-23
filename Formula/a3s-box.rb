class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.3.0/a3s-box-v3.3.0-macos-arm64.tar.gz"
      sha256 "9f33f8b555efc3002053ddd82aeaefe8b3bb27edbc04ecff1a2bdc7c6e3f9fe3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.3.0/a3s-box-v3.3.0-linux-arm64.tar.gz"
      sha256 "063362ccfb7c2cf8a19947d8f615b25cf3501b90bee0d6cbf0ee9042272d71c0"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.3.0/a3s-box-v3.3.0-linux-x86_64.tar.gz"
      sha256 "8a2373522b99bb8eb1a010eccf3d1624c452912433ba29e9c0e86cd64bf235bd"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-oci" if File.exist?("a3s-oci")
    bin.install "a3s-oci-agent" if File.exist?("a3s-oci-agent")
    bin.install "a3s-box-sandbox-oci-launcher" if File.exist?("a3s-box-sandbox-oci-launcher")
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
    lib.install Dir["lib/*"] if Dir.exist?("lib")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
