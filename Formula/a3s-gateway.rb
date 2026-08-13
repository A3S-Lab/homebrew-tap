class A3sGateway < Formula
  desc "AI-native API gateway — SSE streaming, scale-to-zero, safe model rollouts"
  homepage "https://github.com/A3S-Lab/Gateway"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.1.0/a3s-gateway-1.1.0-darwin-arm64.tar.gz"
      sha256 "12e7d727b264683f88b1f7bb796a2a01e26468fc04ddc8dc22506cc762b5d6f9"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.1.0/a3s-gateway-1.1.0-darwin-x86_64.tar.gz"
      sha256 "6c9a5f9a55cefc8eee46d037cda77987f0c6ae7e13d43737f953c98bfea524d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.1.0/a3s-gateway-1.1.0-linux-arm64-musl.tar.gz"
      sha256 "d167e02c6c7157872c542593dcf33426ce615fdfa7e73810402fe6c50276fb9d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v1.1.0/a3s-gateway-1.1.0-linux-x86_64-musl.tar.gz"
      sha256 "4a14f7e822f9304f2236ed7652849da12c7874e061583375408ec63446a5ad38"
    end
  end

  def install
    bin.install "a3s-gateway"
  end

  test do
    assert_match "a3s-gateway", shell_output("#{bin}/a3s-gateway --version")
  end
end
