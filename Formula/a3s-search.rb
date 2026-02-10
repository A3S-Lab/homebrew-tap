class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.3/a3s-search-0.5.3-darwin-arm64.tar.gz"
      sha256 "687f88732b51bceffab54c74017e25c50be3b6675b30b6b9103b09eb2e8bb85b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.3/a3s-search-0.5.3-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER_X86_64_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.3/a3s-search-0.5.3-linux-arm64.tar.gz"
      sha256 "50785988a86ff7eb120324c7e3b45f222216ec26fe89e812160604f7e4ff4d99"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.3/a3s-search-0.5.3-linux-x86_64.tar.gz"
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
