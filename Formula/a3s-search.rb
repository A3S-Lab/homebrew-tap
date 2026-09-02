class A3sSearch < Formula
  desc "Embeddable metasearch CLI with browser, HTTP/RSS, and native API sources"
  homepage "https://github.com/A3S-Lab/Search"
  version "3.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.0.10/a3s-search-3.0.10-darwin-arm64.tar.gz"
      sha256 "fb451dfc27fe07e225c69e5f20ede4b6c61a127687abb9b2c6073067023cec0c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.0.10/a3s-search-3.0.10-darwin-x86_64.tar.gz"
      sha256 "f60660b54986ae6d58e17bfa4eac420007a4bb511657c546f3038c89c893cb11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.0.10/a3s-search-3.0.10-linux-arm64.tar.gz"
      sha256 "e2b04dd0d74e370857c333427529d66e7cbc7d23841264a5ddd325d8a176e5c7"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.0.10/a3s-search-3.0.10-linux-x86_64.tar.gz"
      sha256 "2017ab3cb8933dfff8a8f6b35b0ea595eb2f2f2f1e71150bdf0bf9a8077c106f"
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
