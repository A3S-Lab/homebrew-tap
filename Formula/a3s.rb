class A3s < Formula
  desc "A3S coding agent CLI — `a3s code` launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/Cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.2/a3s-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "57b0891d9c2ac2b3e050994f1f5aa1a6006ada45486a9c3e81e1b8dcf24306e7"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.2/a3s-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "24b53717e0abdd2504f0e416664d4f5af245f8d081f332871ccc674c4da02855"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.2/a3s-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0f3c8050ac1a0f727cb31882b495c077987389c81814af2db44368104d2096f"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Cli/releases/download/v0.2.2/a3s-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ccedff637889f34ec86f4584a00f9b76724047ab9860f58e2383a3ba3b3c24b"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
