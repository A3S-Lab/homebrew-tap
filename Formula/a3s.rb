class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.11/a3s-v0.15.11-aarch64-apple-darwin.tar.gz"
      sha256 "f484d2bafc7cec6b855d943010a33c4571ef2e50d9d95ec2394d3b4a1e8be753"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.11/a3s-v0.15.11-x86_64-apple-darwin.tar.gz"
      sha256 "7d3c8ec718b84889975d05b6892189da27ff71f4f736a779865db25aa4cd6403"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.11/a3s-v0.15.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "09bd7c9b3a218dc4220b6b489f01b4042b0845c394b7b6a5d74e0552531ca964"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.11/a3s-v0.15.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0186565e01a2434116f737fa9230075179353902be7c0a2500f4fca4ab9e3114"
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
