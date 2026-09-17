class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.15/a3s-v0.15.15-aarch64-apple-darwin.tar.gz"
      sha256 "af032a36fab3388083b4c454f7e8061efe3a1b2794ce2fe4370d575ac556f336"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.15/a3s-v0.15.15-x86_64-apple-darwin.tar.gz"
      sha256 "21f67b804f57b81739ae4e8c9fcee9daf0ac25eb829cca6ada225ad23b9c189d"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.15/a3s-v0.15.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "299555bde98a280ab2a6aab3c57c6e9bd94893511d486be808512f862278d6a4"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.15/a3s-v0.15.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88c8b24af501cfafdb17041cee688c71bf76ce99afea6c5ff1dbd8cb3e5bd044"
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
