class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.1/a3s-search-1.4.1-darwin-arm64.tar.gz"
      sha256 "eeb5b23f8b771f9f55d4211f0e1be3e9914e57f0bee08241816ccc0d3d90fcf7"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.1/a3s-search-1.4.1-darwin-x86_64.tar.gz"
      sha256 "26016d70297a6edb9b7e41e87d3f73eb1804fcc4f4b64bd06cbffa100018c85f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.1/a3s-search-1.4.1-linux-arm64.tar.gz"
      sha256 "4e291b75f56caabaffce3dbed967b9716ed05e73838d143773ffb62754e3e4a4"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.1/a3s-search-1.4.1-linux-x86_64.tar.gz"
      sha256 "2ed28d40c39d0f2cb79ef217894d0208d06bcdc4782aee67d950c8a7aeceb52a"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
