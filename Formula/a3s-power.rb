class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.8.0/a3s-power-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "249d547846205f01fcbee3f459190157a8b581b9ed86cd4a750ffb05cb720c4b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.8.0/a3s-power-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "e17d650a1b3ab822dd67aa478030ca92cdc32050dc67ff8dab2292c9b18b5bbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.8.0/a3s-power-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0126e9b17f9eafdfe134995114890a2cb88f37af4ff810de3d91f0bd7eb73e5a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.8.0/a3s-power-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91dde6beabac5a72b79050d22226000bd3d44b1cfc1d568fbbc9d609a09bd3d6"
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
