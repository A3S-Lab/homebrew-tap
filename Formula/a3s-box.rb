class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.4/a3s-box-v3.2.4-macos-arm64.tar.gz"
      sha256 "402f4b9952c4c8be28aaeda1b48115ae7a5fda8c72c41f359f201e5f2e082262"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.4/a3s-box-v3.2.4-linux-arm64.tar.gz"
      sha256 "e5fd9a378113ca85779f34e20477754591a75c568b006ffe86bd804d445ee47b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.4/a3s-box-v3.2.4-linux-x86_64.tar.gz"
      sha256 "bb0cdb096276f03057b90577d4581251cf0801b1409c7dbfae8e928c581d180f"
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
