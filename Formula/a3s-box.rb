class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.2.0/a3s-box-v2.2.0-macos-arm64.tar.gz"
      sha256 "3a987982b192ea914869a8b707270df98b58d0a2245ff0ff91267e3854f3110a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.2.0/a3s-box-v2.2.0-linux-arm64.tar.gz"
      sha256 "658dbd4315a49186e40e176a694984dc12597d6c006b87fae0bdacfe1066bdf9"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.2.0/a3s-box-v2.2.0-linux-x86_64.tar.gz"
      sha256 "a2c3dafeba93b90c2c572273afb8e0004d6cce2b674731d277e935ddce5d7593"
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
