class A3sSearch < Formula
  desc "Embeddable metasearch CLI with browser, HTTP/RSS, and native API sources"
  homepage "https://github.com/A3S-Lab/Search"
  version "3.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.2.0/a3s-search-3.2.0-darwin-arm64.tar.gz"
      sha256 "f0a735aa0ee7ab1419e635112be96b180a93a999f3d3ad79022b96e909cb834f"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.2.0/a3s-search-3.2.0-darwin-x86_64.tar.gz"
      sha256 "8b7fd1b7c2689f69c6ae55c4dee1f118bf46ba5c846fabec57d49c01e75aec0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.2.0/a3s-search-3.2.0-linux-arm64.tar.gz"
      sha256 "e3b44f0f8b331625524b13c4c8ab7e13516a36d0f9a1df156560aa14e74c2ce1"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.2.0/a3s-search-3.2.0-linux-x86_64.tar.gz"
      sha256 "4cef3a6eadb01bda7c601fefdc5662cd1c3874357b6424bfc90eb9d6f0188195"
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
