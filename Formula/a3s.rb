class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.0/a3s-v0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "70adefb45dee09fd01f815471c00de02413024f4a4a96518b4dd087a89ff6a50"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.0/a3s-v0.22.0-x86_64-apple-darwin.tar.gz"
      sha256 "4efc8ed9141b61395821fac110d15bf42ae2c4476830ff641e0e6b811088f158"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.0/a3s-v0.22.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f42f515869a7cee076d6a75061de6bfc8476ff2a5da668955b4335bd855e848b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.0/a3s-v0.22.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5e1ed890d8f036f9f75d9bb428493715d4773399f3583822c2cca304f5c56d4"
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
