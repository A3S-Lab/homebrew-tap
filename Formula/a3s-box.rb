class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-macos-arm64.tar.gz"
      sha256 "2b569f676d1365a124da951c04c5a55951a852c9e53a2f03f16f267030fc31ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-linux-arm64.tar.gz"
      sha256 "c4f16adfc89c24021176fc38fb38ddf06122529382076839db2464f96a7e9636"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-linux-x86_64.tar.gz"
      sha256 "5710e3f6122ca4b74009dd839166a44a61feafb5d1eebd04aae841e3642abf23"
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
