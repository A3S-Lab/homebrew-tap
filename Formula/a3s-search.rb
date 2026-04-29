class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-darwin-arm64.tar.gz"
      sha256 "1af2beff94bcbc7a234a1e15858b7013aeff32400e31b0f7677dbb20afdcd18a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-darwin-x86_64.tar.gz"
      sha256 "715af2e0e3f72665cf2cdf0d96ee21d7f2017598a964502ac6d57160efb30208"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-linux-arm64.tar.gz"
      sha256 "9d02e40eb1b2f6dccfb13f3a60597d18ef38ed2c884e89911cd8daca4a015f21"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-linux-x86_64.tar.gz"
      sha256 "4b65fedba0cdbeccfed74bb24e12e23f3ecf6a22cda9d5be770ece7f0762a58c"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
