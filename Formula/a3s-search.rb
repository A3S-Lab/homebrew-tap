class A3sSearch < Formula
  desc "Embeddable metasearch CLI with browser, HTTP/RSS, and native API sources"
  homepage "https://github.com/A3S-Lab/Search"
  version "3.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.2/a3s-search-3.1.2-darwin-arm64.tar.gz"
      sha256 "cf808a9790792888cd0a27a57486563782b3d099dfa62ee8f30c9d980bed6ffb"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.2/a3s-search-3.1.2-darwin-x86_64.tar.gz"
      sha256 "2bc0eef5866f738e45dbc9a4c13ed86990dcf453bcbf71efc56a35e8932b554e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.2/a3s-search-3.1.2-linux-arm64.tar.gz"
      sha256 "1ff1c80042d3a4140ee0b9e68163ed7bbbdcb856c17875f9716c858df0337ff4"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.2/a3s-search-3.1.2-linux-x86_64.tar.gz"
      sha256 "004c18ba121dbe1ecd79e989484889f93efdc52e56e953f45925922c9d6a1b95"
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
