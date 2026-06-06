class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.7/a3s-box-v2.0.7-macos-arm64.tar.gz"
      sha256 "ec6b0524bdf5e4d50e41e0f84a2902d10094b146718b5aeaccbef0f2fcc2aae8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.7/a3s-box-v2.0.7-linux-arm64.tar.gz"
      sha256 "78841d789eabe0d76f9e4f2e7ee0cae55629de3f1ebb484b0f3ced085553c3e1"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.7/a3s-box-v2.0.7-linux-x86_64.tar.gz"
      sha256 "f544ae35c0d6279d1dd5703096e5b873b8a33e2b0602e33e8b66e3bf47f3ef16"
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
