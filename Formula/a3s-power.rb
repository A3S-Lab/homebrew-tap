class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.0/a3s-power-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "43b0ffd7a4697f83d203b96e285c25eb039dabe2ccd20d14fb7701e5e767e919"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.0/a3s-power-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "0fbb87c4fae410c236e67a233bc33cf35e6c888f970d16c477355e114a5cd490"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.0/a3s-power-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5cdbac1ac0a121e8c679ad40c56e00e61a2e73e62197517ea5d3cc2651a4d1d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.0/a3s-power-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a0cc337f6a8b34c1fffb88496835680b983758fc60f0c8998f3aa5b59b64f087"
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
