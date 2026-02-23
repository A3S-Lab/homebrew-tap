class A3sGateway < Formula
  desc "AI-native API gateway — SSE streaming, scale-to-zero, safe model rollouts"
  homepage "https://github.com/A3S-Lab/Gateway"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v0.2.3/a3s-gateway-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "667c69ef2778e730a51e711201a8ea58433565c83bc8fe124a8eae37b57a1767"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v0.2.3/a3s-gateway-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "075a10a8c1e503531c33d4864f2fd10932cf5c60108262974cf8c3bdd47d7726"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v0.2.3/a3s-gateway-v0.2.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bd7d9e390f1a61a5702c8f026a1bc09934f83d16cdbf182b3f14b1217bc03d45"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Gateway/releases/download/v0.2.3/a3s-gateway-v0.2.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7fac2883851efdb390a9440c5b620639ea001c696c68c92bb675500227b137d2"
    end
  end

  def install
    bin.install "a3s-gateway"
  end

  test do
    assert_match "a3s-gateway", shell_output("#{bin}/a3s-gateway --version")
  end
end
