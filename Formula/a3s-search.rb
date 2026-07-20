class A3sSearch < Formula
  desc "Extensible web search CLI with native AnySearch and Tavily providers"
  homepage "https://github.com/A3S-Lab/Search"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.0.0/a3s-search-2.0.0-darwin-arm64.tar.gz"
      sha256 "b8ed72e0a922da905dd59566a338b9c893171a6ba655eaf8a787f0b86028adf8"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.0.0/a3s-search-2.0.0-darwin-x86_64.tar.gz"
      sha256 "5602e899d83f1fab796d505fbab896b6695b9b8430d7c9c81a930ae05fe37f23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.0.0/a3s-search-2.0.0-linux-arm64.tar.gz"
      sha256 "dde1e89585e3a999f4cb5eacfd2cdd20efc59042b5791fc0167f7e0dd3954672"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.0.0/a3s-search-2.0.0-linux-x86_64.tar.gz"
      sha256 "1ffb0288b060c2520922ee1cfb74f94252e59dbe42799cb2c43f67ea0deb0532"
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
