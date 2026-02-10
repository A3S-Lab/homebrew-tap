class A3sPower < Formula
  desc "Local model management and serving with OpenAI-compatible API"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.1/a3s-power-0.1.1-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.1/a3s-power-0.1.1-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_X86_64_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.1/a3s-power-0.1.1-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.1/a3s-power-0.1.1-linux-x86_64.tar.gz"
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
