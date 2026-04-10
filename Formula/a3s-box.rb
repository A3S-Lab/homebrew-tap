class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v2.0.0/a3s-box-v2.0.0-macos-arm64.tar.gz"
      sha256 "cf506f8354d31e384f681726d009ce16a28ecfa1fdc3c5bde687b866f3194382"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v2.0.0/a3s-box-v2.0.0-linux-arm64.tar.gz"
      sha256 "04b464cff3da557f48e73e5b7d21036620085969adff3da9539a0e1568758d36"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v2.0.0/a3s-box-v2.0.0-linux-x86_64.tar.gz"
      sha256 "13c9bcf40aa3d48425be9ead4f170af0ebaa717f89e085c957ec96423f318d1d"
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
