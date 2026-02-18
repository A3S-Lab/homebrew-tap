class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.7.0/a3s-search-0.7.0-darwin-arm64.tar.gz"
      sha256 "c7ec52916c98c3ea1d0cc4f6b46a14e0887548affe4e85bceef317bfd32da174"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.7.0/a3s-search-0.7.0-darwin-x86_64.tar.gz"
      sha256 "65b3849d49cbb7a89c9c08258c7dcd13d31737c2b202d91f8c2e2aa41f1aa0b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.7.0/a3s-search-0.7.0-linux-arm64.tar.gz"
      sha256 "53581d8ba8c1d963da2f0a026aadb6b712d11150d716d835e8e3b92bc88723c0"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.7.0/a3s-search-0.7.0-linux-x86_64.tar.gz"
      sha256 "ad921dcf0953094f86050272fd5f8bfeb64223d5e3c20d933a00390593f212e2"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
