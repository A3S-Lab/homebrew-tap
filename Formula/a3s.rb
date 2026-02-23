class A3s < Formula
  desc "Local development orchestration tool for the A3S monorepo"
  homepage "https://github.com/A3S-Lab/Dev"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Dev/releases/download/v#{version}/a3s-#{version}-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_MACOS_ARM64"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Dev/releases/download/v#{version}/a3s-#{version}-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER_MACOS_X64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Dev/releases/download/v#{version}/a3s-#{version}-linux-arm64-musl.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Dev/releases/download/v#{version}/a3s-#{version}-linux-x86_64-musl.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X64"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
