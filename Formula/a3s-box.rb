class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.4/a3s-box-v0.8.4-macos-arm64.tar.gz"
      sha256 "d0a9c1bc8edae131416632053c8d0a01c1ffcb928a66af50ede55d1f81b76ce8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.4/a3s-box-v0.8.4-linux-arm64.tar.gz"
      sha256 "fd8982b8b46dda44a3000bd4cd0573225901ca176812413f38ff93109318758d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.4/a3s-box-v0.8.4-linux-x86_64.tar.gz"
      sha256 "0d1eaaf3162d9b0486f983179466f53eb6df8d80ea093fd092f12d1d57bc86ac"
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
