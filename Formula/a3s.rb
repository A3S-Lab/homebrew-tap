class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.8.0"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.0/a3s-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "bf496fe5de8c02e2d0f022e945c8a5263b60ce4f58a6e492493e449099dde3e8"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.0/a3s-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "195b127e60585b3ade6b5682e8031479b4c0473da92c94d9f41a7cdd0585c2b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.0/a3s-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "633e85f70607fe1b16708440c3dfbbefd2a61578da0f499b7437136516e12848"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.0/a3s-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "decb78890e219a739510747e9f7b46bfd96c71410f763cddf71ec8237ceab1bc"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
