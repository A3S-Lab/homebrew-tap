class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.4.0/a3s-box-v2.4.0-macos-arm64.tar.gz"
      sha256 "2c0ae59eddb31f4bf3bf87c146525c9437db1382469634eb9a8f5f7277a1e81a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.4.0/a3s-box-v2.4.0-linux-arm64.tar.gz"
      sha256 "7aaed554c17a33e91769376d19fb242496be8caad60f7068f32c8fd0e2b21078"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.4.0/a3s-box-v2.4.0-linux-x86_64.tar.gz"
      sha256 "043ab3198507be808f71ac3bd2c35cddcbacbcba069f9a7f0fbe451290607f6a"
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
