class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.12/a3s-v0.15.12-aarch64-apple-darwin.tar.gz"
      sha256 "7a6b35e59d60a67f06b51c169a99e6181f23e44eff7767d1284963fadb9a6c86"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.12/a3s-v0.15.12-x86_64-apple-darwin.tar.gz"
      sha256 "75592b9ff6f28a50e79c38ba1355569e747f1fbd5a3d07c017b5aea502e2be76"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.12/a3s-v0.15.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f52b5983eba6abfc0be071c95a6b0494ad94e08721c9a9c39032d74801b83cfb"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.12/a3s-v0.15.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1cce7c9ec7ee7c0c6f8f095cd23f0a182fcf44f5ea455f651cc66ca2e2ec4eb"
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
