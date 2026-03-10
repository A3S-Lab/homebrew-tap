class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.2/a3s-box-v0.8.2-macos-arm64.tar.gz"
      sha256 "7e942991145928d88feaf071627f856a6362f9c594b305483aadcfe375f72478"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.2/a3s-box-v0.8.2-linux-arm64.tar.gz"
      sha256 "fefa7d62467faa9f343eb043290e31b0f8748dfa65fda9ed5887d0c46cb17beb"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.2/a3s-box-v0.8.2-linux-x86_64.tar.gz"
      sha256 "4b91aff64b34740fdc992e916da1eb300bb2cea89f1228886fd9ec54bb2ae4d4"
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
