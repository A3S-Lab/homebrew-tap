class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.7.7"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.7/a3s-v0.7.7-aarch64-apple-darwin.tar.gz"
      sha256 "7c882b399c4c4c4d357b29bb633bde5550629985af58aa4359b480a528b37b44"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.7/a3s-v0.7.7-x86_64-apple-darwin.tar.gz"
      sha256 "8ae56552c66368ad8d9a44a446211a6025b996b44e5fd08ee54030a578242d7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.7/a3s-v0.7.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a1a66e096503895d6de14d14b2810a0795a2470c774eb91f8ff3fe9e25f60a8"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.7/a3s-v0.7.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca20a30c63431642d3a907c3be485983f745bc2adaee6f284e7bd760d5c3da02"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
