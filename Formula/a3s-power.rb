class A3sPower < Formula
  desc "Local model management and serving with OpenAI-compatible API"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.2/a3s-power-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "f906ad92be4ced8105688c0c50b32c303d3d1968b9e6f63fd581511d1cc732b7"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.2/a3s-power-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_X86_64_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.2/a3s-power-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.2/a3s-power-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X86_64_SHA256"
    end
  end

  def install
    bin.install "a3s-power"
  end

  test do
    assert_match "a3s-power", shell_output("#{bin}/a3s-power --version")
  end
end
