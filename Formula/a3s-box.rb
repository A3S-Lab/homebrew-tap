class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.0/a3s-box-v0.5.0-macos-arm64.tar.gz"
      sha256 "739d21a4ec81d8b8bb87d18e64398a5aaeda20bf4f0a308d55a955127911d074"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.0/a3s-box-v0.5.0-linux-arm64.tar.gz"
      sha256 "1c3819f4196b33182202d889ac76c6da49503f2fa716f9b485608b6b8f070802"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.5.0/a3s-box-v0.5.0-linux-x86_64.tar.gz"
      sha256 "cc96c25655c78da1b3d977992dc2776d77211de9aa6d4f42d09633a344ab549f"
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
