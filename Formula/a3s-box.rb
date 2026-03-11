class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.6/a3s-box-v0.8.6-macos-arm64.tar.gz"
      sha256 "8cf2751fbec7976f373a2ba979374cf5b19717ef780fa943093f799f9812f3f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.6/a3s-box-v0.8.6-linux-arm64.tar.gz"
      sha256 "a3481503aceb151a157d5d97299a5e69e51cba1e7e5d5c74a2971e234e8c1618"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.6/a3s-box-v0.8.6-linux-x86_64.tar.gz"
      sha256 "e34039b1be95e72de1e79456fc4ec5335f233eae2db5af657406dd17cfc674c8"
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
