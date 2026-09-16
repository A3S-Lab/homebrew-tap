class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.14/a3s-v0.15.14-aarch64-apple-darwin.tar.gz"
      sha256 "6a173076fc6d0e8e2a640498c54c31637cce59dfedd610e09ac1ddec49fbe6e2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.14/a3s-v0.15.14-x86_64-apple-darwin.tar.gz"
      sha256 "28b91201a72c2cca7847d550a287e7ed7c21e49f6ba8d386f49098f0e9716952"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.14/a3s-v0.15.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce51ca163addeff9fdae865bc78ce22ca06f1a1b3403fdcf8a0bfa2d34680d01"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.14/a3s-v0.15.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cda15a1de9c97610d2b6a0582f04f3738e042cfe79cd6def727c63aa598860b8"
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
