class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.9.0/a3s-power-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "9ed4a69eeb2c842223c828ce862a5357a6e9f175b5bab81cfa7cdc2200fb074a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.9.0/a3s-power-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "cff0936d704ea233b27898d8fe96a35363d72de7448d00ab7f6af9d7273c7cbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.9.0/a3s-power-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8160d220bdd1adc49664f3f258b2c774e528c6362767bb5b9743131b10d1e50b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.9.0/a3s-power-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "330cae827517dbf3731c5f9c1e3c5a4a94f25f07feec8fa03cd258ea11e0daca"
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
