class A3sSearch < Formula
  desc "Embeddable metasearch CLI with browser, HTTP/RSS, and native API sources"
  homepage "https://github.com/A3S-Lab/Search"
  version "3.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.1/a3s-search-3.1.1-darwin-arm64.tar.gz"
      sha256 "098e7ab21aafce096ec2b89922c2cbc9ea1729f56962fd5646c22e97b5d83877"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.1/a3s-search-3.1.1-darwin-x86_64.tar.gz"
      sha256 "c874cdb07a24477efe23a11f9eaabc132f10167b81058716776f8cb13af1436c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.1/a3s-search-3.1.1-linux-arm64.tar.gz"
      sha256 "f500594d2049e16c84345e50cd5bdbd9cd1d8f83fb6e8c0016086d848e855a4b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.1/a3s-search-3.1.1-linux-x86_64.tar.gz"
      sha256 "c5980e8a784cf97d3cf4619397ab37ca0b0472f4566761209ac94bc6a60830b7"
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
