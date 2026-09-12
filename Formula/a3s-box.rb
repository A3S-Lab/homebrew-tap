class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.6/a3s-box-v3.2.6-macos-arm64.tar.gz"
      sha256 "d9d032df47dc1dd007ef4549c32af2525a15f49b8a4f339035e1bb2e02036ad3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.6/a3s-box-v3.2.6-linux-arm64.tar.gz"
      sha256 "e2a07ae21d9b44ff710c55d2ffdece35f03ee850c66253098dd7aca7f5323c8c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.6/a3s-box-v3.2.6-linux-x86_64.tar.gz"
      sha256 "7c9b498be8ba349d3d5dcfc42613c9b6482b88a3d4eee1fc48b173b0b3e8b2ad"
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
