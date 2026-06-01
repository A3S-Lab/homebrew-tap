class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.6/a3s-box-v2.0.6-macos-arm64.tar.gz"
      sha256 "10719d143e519120e255884d42d40365d4d637a7db8016ac65658ca0d598ec4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.6/a3s-box-v2.0.6-linux-arm64.tar.gz"
      sha256 "058805921dfcd94a14416d679ed2d4dbda19728eae0833978a453f5f55dfc5fe"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.6/a3s-box-v2.0.6-linux-x86_64.tar.gz"
      sha256 "333c39f159757d1067b751b05e3beeba6b6e16b3cd52539f5532a3ca21e422f9"
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
