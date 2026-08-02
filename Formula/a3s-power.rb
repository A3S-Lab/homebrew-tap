class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.7.0/a3s-power-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "b81fbd1dd016824d03e69dd044365c36024cd7a43b6796bc054fe5ef46fad41a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.7.0/a3s-power-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "bf64cc778be57cde218e5c484b86a0f32daa11e132ce1756b2b8f39a7ed2e006"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.7.0/a3s-power-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a4f2a2ea54370f43a9fbd6ca877dc25d775515a813b226ecc4c5391fab4bf0b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.7.0/a3s-power-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6700830904055e850c87359bab5ad76292785805d5b4d9d39c03e160ad83250b"
    end
  end

  def install
    bin.install "a3s-power"
    bin.install "a3s-power-verify"
  end

  test do
    assert_match "a3s-power", shell_output("#{bin}/a3s-power --version")
  end
end
