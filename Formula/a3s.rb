class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.13/a3s-v0.15.13-aarch64-apple-darwin.tar.gz"
      sha256 "9c6177ac69e5c56b202521ab82a420b44ef5265c3116bb87bf32add573ae63b0"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.13/a3s-v0.15.13-x86_64-apple-darwin.tar.gz"
      sha256 "cad9ee044f513de773b3e8877279088a3dff7dac6cb6910e83be8a0a9723206e"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.13/a3s-v0.15.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb6963de173c2a5a2ab787fe5f76bb83c6d5c62159661c46841691dacc0f2e3b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.13/a3s-v0.15.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1bd5314c3ee46d3d101c9dd710b828ed60c90f29b46ad4de834a85e79094cfd9"
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
