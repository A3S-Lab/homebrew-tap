class A3s < Formula
  desc "A3S coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  version "0.7.5"
  license "MIT"

  on_macos do
    # RemoteUI popup helper (own repo/formula): A3S-Lab/WebView. Pulled
    # in automatically so the inline OS popup works out of the box.
    depends_on "a3s-lab/tap/a3s-webview"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.5/a3s-v0.7.5-aarch64-apple-darwin.tar.gz"
      sha256 "67f317232ac5abdfce83c6a618aa125abd9de58c23cac644a55273f2e0cf5b68"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.5/a3s-v0.7.5-x86_64-apple-darwin.tar.gz"
      sha256 "573d4e83be9b339ef576641cd8aee48f71f0c859a69f32de1129ef401e1f373e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.5/a3s-v0.7.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "233f033f94f715a48414c10567f5fc5d1bfa3df16b04b6db18f83939f9575458"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.7.5/a3s-v0.7.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "839d81e0af3b76254f928241eebd4e52295efb207eb4de5c1bbb6ff943692408"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
