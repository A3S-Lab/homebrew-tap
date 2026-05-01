class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.2/a3s-box-v2.0.2-macos-arm64.tar.gz"
      sha256 "314d4748e861c2801743d10ffc9f64ca458e8796a0c11ee3d244355259c05bc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.2/a3s-box-v2.0.2-linux-arm64.tar.gz"
      sha256 "9e7ad54a2b2252d80be48da486444f109356639a73bb18150e62f46d63c00a16"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.2/a3s-box-v2.0.2-linux-x86_64.tar.gz"
      sha256 "63ec2bf2797c093a0b6d5d2a75ad2f6045c8d39f4a0fa3046c94413f547d4b9c"
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
