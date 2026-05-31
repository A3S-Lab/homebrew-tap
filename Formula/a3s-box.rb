class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.5/a3s-box-v2.0.5-macos-arm64.tar.gz"
      sha256 "4ca7393d27e3ee30d8a685fbd86606219c512861d85fef8f927d5d01870cfc12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.5/a3s-box-v2.0.5-linux-arm64.tar.gz"
      sha256 "8cef71c3265aaee6e8fc573db8db43a5f237dd59a13a639b6e7db3918b2a54a9"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.5/a3s-box-v2.0.5-linux-x86_64.tar.gz"
      sha256 "1562ea61664ece569ee73cd03c873e334cd880ffb08f42171fdf8ef81d7e6139"
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
