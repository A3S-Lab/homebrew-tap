class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.10/a3s-box-v3.0.10-macos-arm64.tar.gz"
      sha256 "47ee86e40a42be4cb642a5670bae2c95c3c429bd40ccf7676b7b9c3c75ba9708"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.10/a3s-box-v3.0.10-linux-arm64.tar.gz"
      sha256 "4955d784b5b7a8f937d768771a2140420c2b531e9926a20d7e67d564f4b8b523"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.10/a3s-box-v3.0.10-linux-x86_64.tar.gz"
      sha256 "23b1544c3ad1cd2bb824e79504ba9c4831aaa344432bd8ae3c07b4a7c6fdabfd"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
    bin.install "a3s-box-e2b" if File.exist?("a3s-box-e2b")
    lib.install Dir["lib/*"] if Dir.exist?("lib")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
