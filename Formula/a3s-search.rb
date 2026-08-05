class A3sSearch < Formula
  desc "Embeddable metasearch CLI with browser, HTTP/RSS, and native API sources"
  homepage "https://github.com/A3S-Lab/Search"
  version "3.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.0.9/a3s-search-3.0.9-darwin-arm64.tar.gz"
      sha256 "4d3b184a00625d78fc05b7ac9fa8cb683e72a7fe552702e5c322f0541bf8619c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.0.9/a3s-search-3.0.9-darwin-x86_64.tar.gz"
      sha256 "42116ae5744b169d5a3ae3189d431e58b1057441b016fa116f7e53a424652eb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.0.9/a3s-search-3.0.9-linux-arm64.tar.gz"
      sha256 "210613f89b7ef267ed2f8f1e0900c3bd495cd30dc2ec69777527352113c84697"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.0.9/a3s-search-3.0.9-linux-x86_64.tar.gz"
      sha256 "819129d2b848e1ec27bcc0b778dea0b0223768bd5c0c75f20032edc99869e348"
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
