class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "a3s-lab/tap/a3s-webview"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.13/a3s-v0.10.13-aarch64-apple-darwin.tar.gz"
      sha256 "550179cd2b724e85fc65399c38b52a899737ceb5711d8546fbe96454fd3a953a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.13/a3s-v0.10.13-x86_64-apple-darwin.tar.gz"
      sha256 "0a94e5355f599ee4a390fb2b6ca0db27cdd7b3f67e0a80b6e84eab85dfa971ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.13/a3s-v0.10.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81b5eb0b3ee0322901fa9b87235e6936b074884e8602f5533d85b98481b5f4f0"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.13/a3s-v0.10.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "458e416592c6ef24b9025e8ef307fa84ed8d2d5b6d5c74b8ecddc0ca75edf651"
    end
  end

  def install
    bin.install "a3s"
    pkgshare.install "web"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
    assert_path_exists pkgshare/"web/index.html"
  end
end
