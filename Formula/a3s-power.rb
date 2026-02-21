class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.3.0/a3s-power-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "f032d30e0ed971bf36fb30367dd7aa7ba6294d5b4687234a853a3a2eb117d353"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.3.0/a3s-power-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "0183b7e3d5c2cca6c6a2ceef605ffcaaa3ab9e91129262acd6c6cd3f268bd09b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.3.0/a3s-power-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59003446704268be78beb89bc91fcece2e8d34787204b6c2cf146188753106e7"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.3.0/a3s-power-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c8a7bf491d62ca8edd8b0d665790f152512f299fb14bc9f7f8a3bd86e01c6a58"
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
