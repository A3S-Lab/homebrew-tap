class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-darwin-arm64.tar.gz"
      sha256 "7db89f26bd6895fe7ac191612fa5b7fd7e6e12786329a13f59b5492cd1d58f72"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-darwin-x86_64.tar.gz"
      sha256 "12286cfc3685e1173d7f4b4880e129ffe2ce14672168875cecc53e0be0b2c906"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-linux-arm64.tar.gz"
      sha256 "8a21e6f5acb60b9844714f92bd3fb561e22e1e4a484f0a262bf209d80840ae78"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-linux-x86_64.tar.gz"
      sha256 "d21e85f15980ac588ff7ca3cfe4eae30308b3f871a2087d859df8c1d38b6fbc2"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
