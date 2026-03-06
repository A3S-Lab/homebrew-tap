class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-macos-arm64.tar.gz"
      sha256 "83251999906d7495e07715cae548a30fde19eba998e3dfd1f3f9c23ab0c85182"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-linux-arm64.tar.gz"
      sha256 "86cd4c9c9d1386d4208ff9cdb401159510c4ddfc4ffadbb8187d70d18c4cc6b1"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.0/a3s-box-v0.8.0-linux-x86_64.tar.gz"
      sha256 "6fe51dd39b308e3da3184bfa6be55c1f4ddd72f58b958365c43e954a820e7296"
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
