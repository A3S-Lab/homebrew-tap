class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.2/a3s-box-v3.0.2-macos-arm64.tar.gz"
      sha256 "9e08184bc3a94d7190f2a907406581803adac65f13ffe0f069989099329f5a17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.2/a3s-box-v3.0.2-linux-arm64.tar.gz"
      sha256 "bb2050984c9a76b00bd85ae44907cb52e8a77bae4c92f2085e57fb065388fc15"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.2/a3s-box-v3.0.2-linux-x86_64.tar.gz"
      sha256 "d79f4965fc61d5d3cda60df30b4d1c828cd22b9fd97d3308ad210a45bc3c0fcf"
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
