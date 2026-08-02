class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.6.0/a3s-power-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "df8d59144b6660426cc1118f8d84724714a75c7e0fb0b433228aa452db6367cf"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.6.0/a3s-power-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "1e23780e0006c53ba65f2a5126b87e9c510d7f3548cfa78f4f3f5eade5a4d9c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.6.0/a3s-power-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf162b29dfd09917941d3c56e22351079fa55d0226e1e854e47cfea72e968e58"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.6.0/a3s-power-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4792eb20139d6458dd09a3981377114ce2f98d970b2fe109cdd14ccc48995f0"
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
