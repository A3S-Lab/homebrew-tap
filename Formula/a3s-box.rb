class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.0/a3s-box-v0.5.0-macos-arm64.tar.gz"
      sha256 "b70317987ee9411750f75d6cf6423b2ad9f3d265c426d50f2439a91172b87c35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.0/a3s-box-v0.5.0-linux-arm64.tar.gz"
      sha256 "6b661d325618ba7e97b343e94fa6307e2bc85e807d74ebe3efbcfd6e001fe343"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.0/a3s-box-v0.5.0-linux-x86_64.tar.gz"
      sha256 "f91bcc97da4e4bc92f23534a4a23321b58b53362f723b8c96ad1d19242bab046"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
