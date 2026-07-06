class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.0/a3s-box-v3.0.0-macos-arm64.tar.gz"
      sha256 "10677ea929194f86457ce56e1c70fb46c40065a89f58c0c7a711134ecbe0ed5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.0/a3s-box-v3.0.0-linux-arm64.tar.gz"
      sha256 "8c4057a14d30b6d73f999965fbdfef92f06537decbf90da7dbfc020e018144a9"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.0/a3s-box-v3.0.0-linux-x86_64.tar.gz"
      sha256 "6d56766ebeed2598602e392b042a96df6df6f254356b74e09a51c63053365ee4"
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
