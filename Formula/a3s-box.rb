class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.1.0/a3s-box-v3.1.0-macos-arm64.tar.gz"
      sha256 "84763863d221cbc2fc50deecc6469dcaef837e7ae644667491b1dc74346000f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.1.0/a3s-box-v3.1.0-linux-arm64.tar.gz"
      sha256 "fb78870ed724c181568f42dc62f68d415185898513250d419d388ffb096a73ab"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.1.0/a3s-box-v3.1.0-linux-x86_64.tar.gz"
      sha256 "53802e89e62db3259cfd542aaca0abefc01d3de7c086cda6aafb1ef739cbdd45"
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
