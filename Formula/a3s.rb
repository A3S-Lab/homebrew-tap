class A3s < Formula
  desc "Local development orchestration tool for the A3S monorepo"
  homepage "https://github.com/A3S-Lab/Dev"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.3/a3s-0.1.3-darwin-arm64.tar.gz"
      sha256 "57e558d890c12e992851f9575f9baed425ebe44c7eb7660d2a66b109fde1e803"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.3/a3s-0.1.3-darwin-x86_64.tar.gz"
      sha256 "179ad06487d9d24bab27c8399f4b0c89ed7991d1289e8af5cf144fe54c353e0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.3/a3s-0.1.3-linux-arm64-musl.tar.gz"
      sha256 "2c2df0d32fe76bfe6bd95fa24829789d1a262f7faf8bbaf4c3e2cea3562102d0"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.3/a3s-0.1.3-linux-x86_64-musl.tar.gz"
      sha256 "6f5daa56e449450d779bffbabc8343d6e1df446a2fd0fada5c495056e9af0a22"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
