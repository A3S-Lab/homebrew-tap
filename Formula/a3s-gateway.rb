class A3sGateway < Formula
  desc "AI-native API gateway — SSE streaming, scale-to-zero, safe model rollouts"
  homepage "https://github.com/A3S-Lab/Gateway"
  version "1.0.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.13/a3s-gateway-1.0.13-darwin-arm64.tar.gz"
      sha256 "6357f81eefbf93b84f57abc5d48a420a843eeddd2a436e3c64b664f1c42468fd"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.13/a3s-gateway-1.0.13-darwin-x86_64.tar.gz"
      sha256 "04cd5ada9680110a30bf92cdb8b363bfedf10757b7b8b22932c07fa6ead76412"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.13/a3s-gateway-1.0.13-linux-arm64-musl.tar.gz"
      sha256 "b8ab245850aeb1fe5ddee12ffeec4f57b2b284e646bc2024acf3234af800a73d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.13/a3s-gateway-1.0.13-linux-x86_64-musl.tar.gz"
      sha256 "53ff4decf5fa0e06e8c5815f097472a6f8562952e86a7f35447ee5f865e30cf7"
    end
  end

  def install
    bin.install "a3s-gateway"
  end

  test do
    assert_match "a3s-gateway", shell_output("#{bin}/a3s-gateway --version")
  end
end
