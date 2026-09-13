class A3sSearch < Formula
  desc "Embeddable metasearch CLI with browser, HTTP/RSS, and native API sources"
  homepage "https://github.com/A3S-Lab/Search"
  version "3.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.4/a3s-search-3.1.4-darwin-arm64.tar.gz"
      sha256 "b573ee77c8e0d1cd5e8664f1041c331500d4bc5f5bed4dd37ac04b02643267c4"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.4/a3s-search-3.1.4-darwin-x86_64.tar.gz"
      sha256 "176274d7ba10f116c1a21c35c59bcc940f3d65ecf3bf366faa03d902ca429411"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.4/a3s-search-3.1.4-linux-arm64.tar.gz"
      sha256 "a24dc1bc77c92769442df70da0bdf6bcca77027c9cd2d0ffb35de9faefb9da1b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.4/a3s-search-3.1.4-linux-x86_64.tar.gz"
      sha256 "54e7aff9aa8da894aef50527b974fa0bf2ce3c9cf4b5450a8632ca7e64763814"
    end
  end

  def install
    bin.install "a3s-search"
    (pkgshare/"skills").install "skills/a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
    assert_path_exists pkgshare/"skills/a3s-search/SKILL.md"
    assert_path_exists pkgshare/"skills/a3s-search/agents/openai.yaml"
  end
end
