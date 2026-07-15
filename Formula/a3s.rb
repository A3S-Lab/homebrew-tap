class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.8.2"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.2/a3s-v0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "f0d17b4a8ae0843133ceca712d096b5a22b41ab27e4043556dab24b785fc46de"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.2/a3s-v0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "c8da5b50384ba764df13bb273ce20da894933e5d2c2730b01f35161f4a683f1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.2/a3s-v0.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e9d391246541afe9257bf7f0506183039d3dabd5b1725af9ea955db5390da16"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.8.2/a3s-v0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b5f4d3abfc46d716c59dbe646f9652a1b509ae487b12eb9a8a55858f45621c0"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
