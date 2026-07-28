class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "a3s-lab/tap/a3s-webview"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.11/a3s-v0.10.11-aarch64-apple-darwin.tar.gz"
      sha256 "91886f2b34071425d61d9123195dba015c06742fdc5a1f0ce830d6b928d04f1c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.11/a3s-v0.10.11-x86_64-apple-darwin.tar.gz"
      sha256 "0c89bc2a84ede8cc180171ad51fc102c5bffb9ad6aaec52659177c7ee6a4b071"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.11/a3s-v0.10.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "378305d3f58bba49c4ca0721a5f73ce33dd19696614f00f4c0081a090c0647a2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.11/a3s-v0.10.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5ae083375852b137612c98d7d15c1a00ec56ba07558c57b7fddc811589df4fa"
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
