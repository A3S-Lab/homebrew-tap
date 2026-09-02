class A3sSearch < Formula
  desc "Embeddable metasearch CLI with browser, HTTP/RSS, and native API sources"
  homepage "https://github.com/A3S-Lab/Search"
  version "3.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.0/a3s-search-3.1.0-darwin-arm64.tar.gz"
      sha256 "f611f37709575fb7880ac23ef48f1a77c6c89e483a0f36b71a3cd961b8477afd"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.0/a3s-search-3.1.0-darwin-x86_64.tar.gz"
      sha256 "d750835a440f9f13f0c3b492943a5dac5a08a018531ee2c1fb831041efe47039"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.0/a3s-search-3.1.0-linux-arm64.tar.gz"
      sha256 "6c71f1518d1646fb2f4b1fb247d18d4dc10e7d839357a6d1aa84279ceab916d1"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v3.1.0/a3s-search-3.1.0-linux-x86_64.tar.gz"
      sha256 "0b4a4509ad9a4706ee50f0f155e993625eaffcbaf0f8cc836b61544c94f27559"
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
