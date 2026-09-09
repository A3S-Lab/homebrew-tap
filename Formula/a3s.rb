class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.4/a3s-v0.15.4-aarch64-apple-darwin.tar.gz"
      sha256 "bf582214d6edc726a9f98ad15a8e40e6afdc61550285e8f091f11fd67f82ba30"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.4/a3s-v0.15.4-x86_64-apple-darwin.tar.gz"
      sha256 "cc2950d98462e39dd70e363d5f00b759bac3b13a185c2e94315eddeacf65bafb"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.4/a3s-v0.15.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce0e60816cfcd0f742b7a2fd327d0e81376d254c5ebafcc0bb799b62c82055b6"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.4/a3s-v0.15.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a3bf7eb2ed5934782c1e7c8adf841fbb3cfd460293baba56a0b06ae379983f9"
    end
  end

  def install
    bin.install "a3s", "a3s-webview"
    # Keep the target-specific Moli sidecar beside the executable;
    # Code Core discovers bin/moli/moli without a second download.
    bin.install "moli"
    # Ship libzvec_c_api next to a3s so @loader_path / $ORIGIN resolve.
    if (buildpath/"libzvec_c_api.dylib").exist?
      bin.install "libzvec_c_api.dylib"
    elsif (buildpath/"libzvec_c_api.so").exist?
      bin.install "libzvec_c_api.so"
    else
      odie "release archive is missing libzvec_c_api"
    end
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
    assert_predicate bin/"moli/moli", :exist?
    assert_match "usage: a3s-webview", shell_output("#{bin}/a3s-webview --help")
    assert_predicate bin/"libzvec_c_api.dylib", :exist? if OS.mac?
    assert_predicate bin/"libzvec_c_api.so", :exist? if OS.linux?
  end
end
