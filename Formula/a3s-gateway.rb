class A3sGateway < Formula
  desc "AI-native API gateway — SSE streaming, scale-to-zero, safe model rollouts"
  homepage "https://github.com/A3S-Lab/Gateway"
  version "1.0.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.14/a3s-gateway-1.0.14-darwin-arm64.tar.gz"
      sha256 "4045db16b729396a88f4f57e9eb6bd39fd44ea0b00b1c0b215941873af803f51"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.14/a3s-gateway-1.0.14-darwin-x86_64.tar.gz"
      sha256 "7180810a2bc2f68aca65ec0a8cb478d72247a7fb155ff37958fbc08f636ae02d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.14/a3s-gateway-1.0.14-linux-arm64-musl.tar.gz"
      sha256 "323a18065161fcde5ac5d61eb33868cf00fda41ee3c598ab455e849c1dbee7d2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.0.14/a3s-gateway-1.0.14-linux-x86_64-musl.tar.gz"
      sha256 "7ea55ae5c9f92ec34f50f55a16a7e17c43669d37f909ec2769fddaa9dcd9aec0"
    end
  end

  def install
    bin.install "a3s-gateway"
  end

  test do
    assert_match "a3s-gateway", shell_output("#{bin}/a3s-gateway --version")
  end
end
