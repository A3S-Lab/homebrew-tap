class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.5/a3s-box-v3.0.5-macos-arm64.tar.gz"
      sha256 "2f32b4ce84b41582c1f3892633c12224140163c7b47ef4a9d5711c418ef18d38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.5/a3s-box-v3.0.5-linux-arm64.tar.gz"
      sha256 "e1d44a8a204710735af363a07fca0e3d5feb0385625c25ce2506ad0a8dafebaf"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.5/a3s-box-v3.0.5-linux-x86_64.tar.gz"
      sha256 "5bdd3e794eaf18f440ab6de0ac63748275a375ee0e4b34055fcb187789b64fc6"
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
