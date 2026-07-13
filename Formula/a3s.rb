class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.7.9"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.9/a3s-v0.7.9-aarch64-apple-darwin.tar.gz"
      sha256 "3d068b9f97e99ec006e7d4a4a9b5f5bf4c31ee71558015842e30df23f9554369"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.9/a3s-v0.7.9-x86_64-apple-darwin.tar.gz"
      sha256 "7c483e29803768cd466d354b62e4331586d7b2fc8ac8828c850eb7988998ddf8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.9/a3s-v0.7.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80718406eb75615fd40d6bab9c3f8829bbdd428cd194196b6a793704e8453e65"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.9/a3s-v0.7.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ea985256f4d9dfe67d7a7181374b3855333740a6500593304af1b0cdd2dfec2"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
