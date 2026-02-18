class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.2/a3s-box-v0.5.2-macos-arm64.tar.gz"
      sha256 "d05be4f4725b2b52a8c3b90b28720f8c49b43ddd6703a7cd7ba50b27aad8a76f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.2/a3s-box-v0.5.2-linux-arm64.tar.gz"
      sha256 "7b96ecbecce7478778e068ce66828e95fd0e03487edc28b80e08fcc98e58f43c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.2/a3s-box-v0.5.2-linux-x86_64.tar.gz"
      sha256 "3655bdb06f4933ea3c279c8dfcaa32d504304072689debc066c573b83198243d"
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
