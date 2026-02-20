class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.3/a3s-box-v0.5.3-macos-arm64.tar.gz"
      sha256 "49a37e3f71cfbb0b8a77039ba2c6018828c994e0251692e7ea0fc8d48ee1494c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.3/a3s-box-v0.5.3-linux-arm64.tar.gz"
      sha256 "864dfe8f252679b1a527e99b3b896ae46857d2fb52a52921fc3019c1bcfad3e2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.3/a3s-box-v0.5.3-linux-x86_64.tar.gz"
      sha256 "eb977193ccd64e87088530be0079a904fa073fed8c5c0c25d9c36d6123ec33a8"
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
