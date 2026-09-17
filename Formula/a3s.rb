class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.16/a3s-v0.15.16-aarch64-apple-darwin.tar.gz"
      sha256 "11cbf4f5f390ef5a4e3a3d2327ab2dab54022ea09de303cdca3d8316d2601406"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.16/a3s-v0.15.16-x86_64-apple-darwin.tar.gz"
      sha256 "e63b70593e1fbc885c373b7a727f6e5b4418b9f8ed15d4aba3e7ab66aba3f939"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.16/a3s-v0.15.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08537cc7df19165251ae44b39a0ac01eb61725d9c3f8eb7b3ec4455436781c66"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.16/a3s-v0.15.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "086909297af8cee5a0b018cf9dc8b5a2817b65713f44325599ced4ad27b0b0cd"
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
