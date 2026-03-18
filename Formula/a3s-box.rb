class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.9/a3s-box-v0.8.9-macos-arm64.tar.gz"
      sha256 "79b74c25cce695637a40ba52292c93ecc7ba8f768269ff0e87feaac450cff6ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.9/a3s-box-v0.8.9-linux-arm64.tar.gz"
      sha256 "bf7c2f59544f52017b755092f1d1d0b9a472271d2511d1490950b1cc5dcd61b8"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.9/a3s-box-v0.8.9-linux-x86_64.tar.gz"
      sha256 "7c17cfc9092ce572d4579a691a1bc5ff87fc24a10bbfac1d32fd0cba563633c5"
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
