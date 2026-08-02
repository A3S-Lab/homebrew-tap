class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.5.0/a3s-power-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "14a906f453686b89dbbe0bb0d2f3a14191f433dceb01eeb9161e62fc49b1b831"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.5.0/a3s-power-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "a258f10e57aa043fb29686f927255e1ccb59bc848edff6af0202dbcb6ef4a14b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.5.0/a3s-power-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d50b858008f7fa27bb80dd71243d8aa135ddab75b32b0a474e1a7aa4081f4227"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.5.0/a3s-power-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44c363952272b339f57a270b64f70d3f849d3682c16685352e259417198db663"
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
