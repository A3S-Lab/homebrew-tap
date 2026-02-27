class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.7.0/a3s-box-v0.7.0-macos-arm64.tar.gz"
      sha256 "3ed87eb9c0e41e5786949e2636a7357f9409e4fa16c2996c29c0f8074290974b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.7.0/a3s-box-v0.7.0-linux-arm64.tar.gz"
      sha256 "5436ad5a57fd0220d4b28fe77e6352278f20fbe12cb609c2f9db4394d40132d5"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.7.0/a3s-box-v0.7.0-linux-x86_64.tar.gz"
      sha256 "baec7759c2a75cfc36ebc496fef7cf8449e09e57c06e40a1adeaa40411fe7ef6"
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
