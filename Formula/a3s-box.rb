class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.9/a3s-box-v3.0.9-macos-arm64.tar.gz"
      sha256 "8fd3fc83fbf1ce6461ad20c44f3f385362c4f6c3b338181f434adb185706eafb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.9/a3s-box-v3.0.9-linux-arm64.tar.gz"
      sha256 "5ac25857a2c0207463c01247e8f4f8135536bf8021257f5d2e9fa84de234c7fc"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.9/a3s-box-v3.0.9-linux-x86_64.tar.gz"
      sha256 "f5361d11a490fe1a637a6ff0da5b7594ee37ae3409ee17cdaf80dbf18d1042e0"
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
