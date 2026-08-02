class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.5.1/a3s-power-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "1f77a226536d62e9d7c06b144e46cab89b671586cdcce496b0fb34eef8a9788b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.5.1/a3s-power-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "f831c98464dc8595a668aeda1b3e22db51ed3a41eb6cef84578fcf041f5d43d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.5.1/a3s-power-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0dc173b3a441c5d2f3a486a36a233a2723b17a6e6a8d7c0668311bf395488f3"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.5.1/a3s-power-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "93f8f643de4a2c1c43383f9b8b6515f7de3022e0dc8fc5adc0cdf992cfde7d9d"
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
