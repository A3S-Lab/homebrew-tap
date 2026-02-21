class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.6.0/a3s-box-v0.6.0-macos-arm64.tar.gz"
      sha256 "6540389d02c00cc90dd6ac7ce01a49c85d4134f841ed691d660ae3e628e9d8d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.6.0/a3s-box-v0.6.0-linux-arm64.tar.gz"
      sha256 "0016818d2dbe90aad7731a7d100e941c9222b29ed66e5afd635fd87e74227027"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.6.0/a3s-box-v0.6.0-linux-x86_64.tar.gz"
      sha256 "67a377269d5eae2d5b6662ed93a7d13001691de0868813b3ff4b957299777b2a"
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
