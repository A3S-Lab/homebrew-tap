class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.6.0/a3s-box-v0.6.0-macos-arm64.tar.gz"
      sha256 "25da847883e321b7506e84c52a64986392ec5bb5a6e352df1b181ecd056cbea2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.6.0/a3s-box-v0.6.0-linux-arm64.tar.gz"
      sha256 "29c4c2886a3429fbdaa81c7dec313b9c2c24e1e9bda3ccb3aa16b8815c403c49"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.6.0/a3s-box-v0.6.0-linux-x86_64.tar.gz"
      sha256 "0ee1ffb8bcfcd65e5e91d27153a5f9c3062933d89f9c56a1ee4fc5631b2c13bb"
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
