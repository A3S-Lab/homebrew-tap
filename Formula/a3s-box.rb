class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.5.1/a3s-box-v2.5.1-macos-arm64.tar.gz"
      sha256 "fa16df0b0595141b73daca4ab5e466f8c1c001fe4b69c44b68e010446d78a191"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.5.1/a3s-box-v2.5.1-linux-arm64.tar.gz"
      sha256 "35eaf845f331da974f26e9ba923e5e40f90ea7bec62765c09f89f6f1bd8b04e3"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.5.1/a3s-box-v2.5.1-linux-x86_64.tar.gz"
      sha256 "61fe9f74406b7d482b915768f94aa9fbe18cfc76dc1731ec55c11be63237bfd7"
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
