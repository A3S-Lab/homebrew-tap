class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.10/a3s-v0.15.10-aarch64-apple-darwin.tar.gz"
      sha256 "7c704aee7cbdc43a2058f53200835dfb202fb3b6ad442e9b11b4ccdbdbcac966"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.10/a3s-v0.15.10-x86_64-apple-darwin.tar.gz"
      sha256 "c88fbf1de7d87ca4742336310914450369b75cedcd7318e32bb918fd78733df6"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.10/a3s-v0.15.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c7b1013c9bcd3fa85bbd9d2ddaf3d24cbacdd59a8b1161d9352ed0c0531fc8c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.10/a3s-v0.15.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "227af419069297e8092eb77a3f8ffa893c94d100afbd78dad3a2417a8259ecf2"
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

  def caveats
    <<~EOS
      The interactive Code TUI is launched with:
        a3s code
    EOS
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
    assert_predicate bin/"moli/moli", :exist?
    assert_match "usage: a3s-webview", shell_output("#{bin}/a3s-webview --help")
    assert_predicate bin/"libzvec_c_api.dylib", :exist? if OS.mac?
    assert_predicate bin/"libzvec_c_api.so", :exist? if OS.linux?
  end
end
