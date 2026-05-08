class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.4/a3s-box-v2.0.4-macos-arm64.tar.gz"
      sha256 "fba2488b648686de46fa3f9c09ce93445a4cd6e128dec2ab377c72e34501db12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.4/a3s-box-v2.0.4-linux-arm64.tar.gz"
      sha256 "b5945206c21832cfb2987a86f0d1ff4f31a7f648189320b0a1d9a3ede3ae8dc2"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.0.4/a3s-box-v2.0.4-linux-x86_64.tar.gz"
      sha256 "b774b7ab61e703bb890945332c709ceb87525e59a96c3e22fa33c5c915b6a9cf"
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
