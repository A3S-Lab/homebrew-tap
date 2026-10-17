class A3sSearch < Formula
  desc "Embeddable metasearch CLI with browser, HTTP/RSS, and native API sources"
  homepage "https://github.com/A3S-Lab/Search"
  version "3.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.4.0/a3s-search-3.4.0-darwin-arm64.tar.gz"
      sha256 "3478a0cce2b0fad1eb34452675c2ef1e1a793c913696a2d36c0804fb73d113c5"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.4.0/a3s-search-3.4.0-darwin-x86_64.tar.gz"
      sha256 "3d10204e76f2bca107fb4e1cbc72abe7dfe7028ca12b179a54dfcd9a73c252c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.4.0/a3s-search-3.4.0-linux-arm64.tar.gz"
      sha256 "67a5b457d3ef0c52ed65881cb0ffa0c37ad1a54379b6745389e1aad0400526c5"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.4.0/a3s-search-3.4.0-linux-x86_64.tar.gz"
      sha256 "4cc97722442ff75b803870ce6652490926a7a72cf6d4c1301532e18d0ca9b9e4"
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
