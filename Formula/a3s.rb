class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.21.0/a3s-v0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "d8c324ef305d2f3a117ea1ecdc9372fe98b73def5cded3fd97ce0cdec3c704d9"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.21.0/a3s-v0.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "f693ed4ac9ef1c97ca5cce81c26dc8361c9c6d127b2d5ab60d940be67819f848"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.21.0/a3s-v0.21.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ec6dab60e6868fc48a76ec590a08b446a2585b6e015e0aca55106b2d25a53b5"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.21.0/a3s-v0.21.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "130502072d517b80d12f921835cf64b517d79620483e5ccb7a2c1009effec1f1"
    end
  end

  def install
    bin.install "a3s", "a3s-webview", "a3s-code-tui", "a3s-code-acp"
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
    assert_predicate bin/"a3s-code-tui", :exist?
    assert_predicate bin/"a3s-code-acp", :exist?
    assert_predicate bin/"moli/moli", :exist?
    assert_match "usage: a3s-webview", shell_output("#{bin}/a3s-webview --help")
    assert_predicate bin/"libzvec_c_api.dylib", :exist? if OS.mac?
    assert_predicate bin/"libzvec_c_api.so", :exist? if OS.linux?
  end
end
