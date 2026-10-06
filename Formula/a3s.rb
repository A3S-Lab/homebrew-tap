class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.1/a3s-v0.22.1-aarch64-apple-darwin.tar.gz"
      sha256 "f2e970b8785ccf7c2e8fe586850c249cf82540411b068e1dfe231c656e98dea2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.1/a3s-v0.22.1-x86_64-apple-darwin.tar.gz"
      sha256 "f45607e2dc4f36d154759515eb7afd292292ffb441c96a42907a0e49f15dc2a8"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.1/a3s-v0.22.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e1474560a6935c7bc2be90b451c7ed58e99f59f83f6aa60cf71499411ac38cb"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.22.1/a3s-v0.22.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b062c1c6e18d2acf39ade8c7078942a61e7ec3b2b32cac16e9baa41abb93075"
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
