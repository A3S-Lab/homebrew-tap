class A3sSearch < Formula
  desc "Extensible web search CLI with native AnySearch and Tavily providers"
  homepage "https://github.com/A3S-Lab/Search"
  version "2.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.2/a3s-search-2.1.2-darwin-arm64.tar.gz"
      sha256 "a2a682de438f843840ca42f656c2df8641d6f4385976efd5c60e6d2cb150bf27"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.2/a3s-search-2.1.2-darwin-x86_64.tar.gz"
      sha256 "37c01e26f5d21f80d9663b648f2c20f1b79bc6ca762b1fdb7fe5cb9fbdc254c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.2/a3s-search-2.1.2-linux-arm64.tar.gz"
      sha256 "e79a0261d018c0fbbb7308f830b00d2fb2e5bdaaa4b4b57dcd3864da152e3451"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v2.1.2/a3s-search-2.1.2-linux-x86_64.tar.gz"
      sha256 "fc6cc9327affca4851933cb17b50030125c93cf998c0c173d4abf7d252dc0b26"
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
