class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.2.0/a3s-power-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "9e40d8408a929908e0a8f87e9f0525bbfae7eb1894c027ab2961f118f05dff40"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.2.0/a3s-power-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "dfa02f7581428c6531e1302141be6dc2cfb51e84eb40c9ea7b7321c9fbbe7b44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.2.0/a3s-power-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8035531f2b5af7dd6bcef33f265ab5972e9ac3b6a903e910e0b6b2ce6c6be0f5"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.2.0/a3s-power-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca0642bd9c301007498d7d04c52d17bc8b6a8749d14ebc3f807f34b1f60602ea"
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
