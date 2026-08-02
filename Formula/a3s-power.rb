class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.4.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.5/a3s-power-v0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "26ba1a69671e74ba795722221519516dfa5f865f8584b4ae2fea7d70cf7a8488"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.5/a3s-power-v0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "b10dbad774e09c1abae1e4d30f06c0130bf4abffd7d701d3208eaf8a6dd19333"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.5/a3s-power-v0.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12cd43b9ea1c9e53f37fdcf94207e5064f4dee5593b98b6851756ea90adf309d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.5/a3s-power-v0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d2a6367e7622835d1c502db09e8d11b4d59fd8501b0ae87e8abbc12f77debd8"
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
