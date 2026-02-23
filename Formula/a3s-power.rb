class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.2/a3s-power-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "9223505f55342d21e9ef4bb23daf7ad2af286d9cb091f5a757fa9270817f9a89"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.2/a3s-power-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "72155e18286956eae52d4aaac828ec6d5f21aba27b9ceb8d17af532d4e315933"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.2/a3s-power-v0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60123c7a641b0a6bc2bf377ed11429a76dbb1392955a52331bf4f90b010ccf21"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.2/a3s-power-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6db096cfdd7f715856706356b81ad497923ed20cafa21f8bda97f8010f01b73b"
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
