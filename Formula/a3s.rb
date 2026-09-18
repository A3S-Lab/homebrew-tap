class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.16.0/a3s-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "4f5fe4a485a806af8f2539acddb0d2cb45db414124555e9ad5179aa1ae863fbf"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.16.0/a3s-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "f20bf6a89254d5b4ceff317c5bb57d7c966cca701f0a673a2c096c7dee1b8ef4"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.16.0/a3s-v0.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7deb627dd6804b3704cbd2beace5651690c5959594a8ac1d9782cbc98e1c97dd"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.16.0/a3s-v0.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a81b097e9064aa51dde4eec92c0ecfa89fe941398d2c04da9b6da9d515e861fe"
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
