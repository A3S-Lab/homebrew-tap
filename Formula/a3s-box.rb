class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.5.2/a3s-box-v2.5.2-macos-arm64.tar.gz"
      sha256 "665b7a867d272b7aa5e1544c2ae9e683d845787c400bf6fa404a30668af2d7b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.5.2/a3s-box-v2.5.2-linux-arm64.tar.gz"
      sha256 "9a9118d87bea6c137bc30a3eb7fb58c4ed16b6c6f47af80d66f59a67ef19fe20"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.5.2/a3s-box-v2.5.2-linux-x86_64.tar.gz"
      sha256 "de8168b770d1b3ff026f0008611e2584074abffb803ac93f4ac7608ace194db1"
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
