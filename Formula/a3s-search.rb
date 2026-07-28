class A3sSearch < Formula
  desc "Extensible web search CLI with native AnySearch and Tavily providers"
  homepage "https://github.com/A3S-Lab/Search"
  version "2.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.1/a3s-search-2.1.1-darwin-arm64.tar.gz"
      sha256 "c61747542bb11fa8225e4ada99cd372ba5516a448174e7692636d80f9e5f5f98"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.1/a3s-search-2.1.1-darwin-x86_64.tar.gz"
      sha256 "1ed23b3f9ac1c8a13bf618b52cd93c09498138decaa4c0bbfd88e13999abffb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.1/a3s-search-2.1.1-linux-arm64.tar.gz"
      sha256 "36b328aad84d29319f19fa74f6f67d19c46126f23f1434abce1bae166df5db43"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.1/a3s-search-2.1.1-linux-x86_64.tar.gz"
      sha256 "e43abdf5d0d008f8154b409ee4d1ef083eb7c97c68d0d165dfa4997b5c469d3b"
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
