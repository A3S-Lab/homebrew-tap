class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.7.0/a3s-box-v0.7.0-macos-arm64.tar.gz"
      sha256 "6e132f7b3b9fe443cc91d4941842c6dadc3b2f718c28d739b44d368376b8190b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.7.0/a3s-box-v0.7.0-linux-arm64.tar.gz"
      sha256 "88c7759cf3eb194b4c3bebbcb9a5486d7ce8727d517d013984ddc0336281fdfb"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.7.0/a3s-box-v0.7.0-linux-x86_64.tar.gz"
      sha256 "50eec07057f2257df2e915080c279a32303ddfc44c091c2cd9a9a10fb3a179b0"
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
