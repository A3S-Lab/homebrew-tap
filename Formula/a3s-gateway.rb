class A3sGateway < Formula
  desc "AI-native API gateway — SSE streaming, scale-to-zero, safe model rollouts"
  homepage "https://github.com/A3S-Lab/Gateway"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v#{version}/a3s-gateway-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_MACOS_ARM64"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v#{version}/a3s-gateway-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_MACOS_X64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v#{version}/a3s-gateway-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v#{version}/a3s-gateway-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X64"
    end
  end

  def install
    bin.install "a3s-gateway"
  end

  test do
    assert_match "a3s-gateway", shell_output("#{bin}/a3s-gateway --version")
  end
end
