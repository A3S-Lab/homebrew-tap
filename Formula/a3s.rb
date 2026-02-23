class A3s < Formula
  desc "Local development orchestration tool for the A3S monorepo"
  homepage "https://github.com/A3S-Lab/Dev"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.1/a3s-0.1.1-darwin-arm64.tar.gz"
      sha256 "dc0bcb334b13c4821da137feb3cb7c2a41f878b5b633cccba6926482f81aae99"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.1/a3s-0.1.1-darwin-x86_64.tar.gz"
      sha256 "00c94ed8cd930bdd0cc78a9f01a98114475284e28a5d27efbaba3d36a94b8701"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.1/a3s-0.1.1-linux-arm64-musl.tar.gz"
      sha256 "b916dfab1df72b96950c2f81f96e0c43f25f1691d22ed518b28d81eba709d80c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.1/a3s-0.1.1-linux-x86_64-musl.tar.gz"
      sha256 "89b27de93337a4a20e6dc41a3ba7da29064f34d2f42e28210e81b906cc8afb68"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
