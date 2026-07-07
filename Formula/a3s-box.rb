class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.3/a3s-box-v3.0.3-macos-arm64.tar.gz"
      sha256 "925055b82472a506eeb5bf2d22504792c5654a7ecb49a6718dab4c49a782b446"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.3/a3s-box-v3.0.3-linux-arm64.tar.gz"
      sha256 "58359ddaf5dc2540699dda4f75c57659ba51d8738a69617ac2ee7cd9b533e3d2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.3/a3s-box-v3.0.3-linux-x86_64.tar.gz"
      sha256 "f2eec351dd845bb68c48fec0cbd7b179948a725e22758b977fb02e8ac72edf94"
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
