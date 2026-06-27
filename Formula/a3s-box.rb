class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.6.0/a3s-box-v2.6.0-macos-arm64.tar.gz"
      sha256 "04d8797d225be387858d4c1770bb4f27dc180b3aec262c60f2f79a367a40e4bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.6.0/a3s-box-v2.6.0-linux-arm64.tar.gz"
      sha256 "d4ad80dfc417a25d154c86489c71c460980db9e97275ad7471ecf407b04c8807"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.6.0/a3s-box-v2.6.0-linux-x86_64.tar.gz"
      sha256 "a36011be1da2aaef5d83291f349d395341a74d2ea2e8955ee03faba8f4d4d998"
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
