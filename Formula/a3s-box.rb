class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.1.0/a3s-box-v2.1.0-macos-arm64.tar.gz"
      sha256 "a89afb76d5425d160d461fd5e648689e94deeda0c0e0b3f0d87e179ccd8290a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.1.0/a3s-box-v2.1.0-linux-arm64.tar.gz"
      sha256 "707244cf760df978e84d38b68c1249d9eace49872afe774e7130ea9c8b25c432"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.1.0/a3s-box-v2.1.0-linux-x86_64.tar.gz"
      sha256 "15a49cd1168d02dbd9ba8a8a168bc8e2a08255d68c90ab3611caf3873c62c407"
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
