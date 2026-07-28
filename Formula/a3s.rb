class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "a3s-lab/tap/a3s-webview"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.14/a3s-v0.10.14-aarch64-apple-darwin.tar.gz"
      sha256 "c0afc3ae0589069d5f52af0350199456088c8e37be74b89e248c93d1450f89d4"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.14/a3s-v0.10.14-x86_64-apple-darwin.tar.gz"
      sha256 "30663b50deacc4f257fb739fb9cc99fe389782b7eda882101bc578d038ee8852"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.14/a3s-v0.10.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a99c956474f406cd42d74946c048655380b93ddfb46010f62ebbdd9b663f9ea"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.14/a3s-v0.10.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7bc6a677db96925ee1f631e8ec8780471c41886766d6b7694ebcee756a82a772"
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
