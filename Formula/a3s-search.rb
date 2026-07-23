class A3sSearch < Formula
  desc "Extensible web search CLI with native AnySearch and Tavily providers"
  homepage "https://github.com/A3S-Lab/Search"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.0/a3s-search-2.1.0-darwin-arm64.tar.gz"
      sha256 "a86c5bfa74a1dd57fd7ae9bf80192d6b9706aedacbc06797a4b3b199a4e3cf1b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.0/a3s-search-2.1.0-darwin-x86_64.tar.gz"
      sha256 "99eff1ce889776235f9431a11d6763833249dde9302218123c201d6429976eae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.0/a3s-search-2.1.0-linux-arm64.tar.gz"
      sha256 "35b075f062fe332a101eb451e1e1173716330c72ebb4e0f7a69f9241a1245f75"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.0/a3s-search-2.1.0-linux-x86_64.tar.gz"
      sha256 "f92f21a0d96e7ad71f994f08f5bf913b5c4fda1ce1e4d4b40c847bcf3b4f3690"
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
