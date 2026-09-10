class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.9/a3s-v0.15.9-aarch64-apple-darwin.tar.gz"
      sha256 "75b5a4b25b87e95211b86fd7b5af18171804050282a227c8755efd979855d8a8"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.9/a3s-v0.15.9-x86_64-apple-darwin.tar.gz"
      sha256 "4c9bba855d9005bc650d185fd317664e3a590a02536a766c1ca1884742ee5dd7"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.9/a3s-v0.15.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a1f414ad73c3323c529593b505617b4139669586a8f0516224ef1c36fe1829f2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.15.9/a3s-v0.15.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f8ca938f5b675c482b0e623c7ab2f02b9d9d1948385f5c75acc7d11fa69e3af"
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

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
    assert_predicate bin/"moli/moli", :exist?
    assert_match "usage: a3s-webview", shell_output("#{bin}/a3s-webview --help")
    assert_predicate bin/"libzvec_c_api.dylib", :exist? if OS.mac?
    assert_predicate bin/"libzvec_c_api.so", :exist? if OS.linux?
  end
end
