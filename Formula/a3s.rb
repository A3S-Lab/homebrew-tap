class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.2/a3s-v0.22.2-aarch64-apple-darwin.tar.gz"
      sha256 "96576b867b5927d606076d42d7b44a255c89df2aee41f43932bc9def05dbd48c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.2/a3s-v0.22.2-x86_64-apple-darwin.tar.gz"
      sha256 "4b9c11f5ffb35ea32d9e91d2d64c33253e6b28fa308c82dc79a147da75f30641"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.2/a3s-v0.22.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48daa841587cccad3dc3302a9a8b476e494aecea2991e88afc86059acffefcf2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.2/a3s-v0.22.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07d82d9ce65dd9c15967007e651962b5c46006e50b6d23222dd03295109b351f"
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
