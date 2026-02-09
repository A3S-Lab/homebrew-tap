class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.1/a3s-search-0.5.1-darwin-arm64.tar.gz"
      sha256 "cb9382650d9617e5e16cb30377cbf0ce94a4c3faaaff8cf21bc9c519da2a1f29"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.1/a3s-search-0.5.1-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER_X86_64_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.1/a3s-search-0.5.1-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.1/a3s-search-0.5.1-linux-x86_64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X86_64_SHA256"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "A3S Search", shell_output("#{bin}/a3s-search --version")
  end
end
