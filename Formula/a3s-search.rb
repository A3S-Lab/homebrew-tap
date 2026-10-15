class A3sSearch < Formula
  desc "Embeddable metasearch CLI with browser, HTTP/RSS, and native API sources"
  homepage "https://github.com/A3S-Lab/Search"
  version "3.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.3.0/a3s-search-3.3.0-darwin-arm64.tar.gz"
      sha256 "fe322627187c7cc0bcda0556e72e60f3b68ed0145320d4774e22aba73ee0d18e"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.3.0/a3s-search-3.3.0-darwin-x86_64.tar.gz"
      sha256 "e1e97e243a43f52028b0fc39fb362f999673104d5f578840d598857f73bb904a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.3.0/a3s-search-3.3.0-linux-arm64.tar.gz"
      sha256 "41e87240b381a98fad11385601d360304838ce343a380cf167a0f8a87d4246cb"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.3.0/a3s-search-3.3.0-linux-x86_64.tar.gz"
      sha256 "29e2dbe577fe912ae3676c9b814d088b01199358750df7b3757ee019a87381fe"
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
