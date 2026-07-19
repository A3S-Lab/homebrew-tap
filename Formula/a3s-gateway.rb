class A3sGateway < Formula
  desc "AI-native API gateway — SSE streaming, scale-to-zero, safe model rollouts"
  homepage "https://github.com/A3S-Lab/Gateway"
  version "1.0.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.12/a3s-gateway-1.0.12-darwin-arm64.tar.gz"
      sha256 "c7f6cb3a5fc0668095b044cae67efb7bca9ac71595db736f451650b4b62df068"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.12/a3s-gateway-1.0.12-darwin-x86_64.tar.gz"
      sha256 "69ff3456e330eed546874c3c089c11bc3a69ae1a9873c08a5566595368c6e94c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.12/a3s-gateway-1.0.12-linux-arm64-musl.tar.gz"
      sha256 "311c787225b8a3bc47ef0ef0cf35aaf8dbece4b2f86d531ea930caff212b45bf"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.12/a3s-gateway-1.0.12-linux-x86_64-musl.tar.gz"
      sha256 "3764236ac9cc333ebe87f9fd8dfb53303875ecc8bf5645f3879aea8ea2953e1d"
    end
  end

  def install
    bin.install "a3s-gateway"
  end

  test do
    assert_match "a3s-gateway", shell_output("#{bin}/a3s-gateway --version")
  end
end
