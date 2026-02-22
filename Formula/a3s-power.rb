class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.0/a3s-power-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "5353058d04db2454a444be21121c2b9e91a5b1c1a440d7fa12cec471ebe3d04f"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.0/a3s-power-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "14b3e651b7a7582ea5a1a025111beb5d33fd71fa62084779d83bc60155d081a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.0/a3s-power-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3586d0039d984b0e221e0850c9c2a0b73f0ce74c15041d8b0c30c888d501eadc"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.0/a3s-power-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21ab09b74fb7eb0ff82f4558db06165e58de956ebe0ac3f6e5786f9e9297ad4b"
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
