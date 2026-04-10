class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-darwin-arm64.tar.gz"
      sha256 "e11d9520a1271d5b143af45019844710cd5e2edcfba1e557e70352460367a544"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-darwin-x86_64.tar.gz"
      sha256 "092162cf74f4dd89093c721555d6886c3b51354ac2243a3c1d9d119c1e2dd79e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-linux-arm64.tar.gz"
      sha256 "6521cd66fc57d4b0e7fbbfac274c4dee95490bf15cb75e792fdd2421335f1be6"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-linux-x86_64.tar.gz"
      sha256 "b1a2023675e3d38d64ab0eafe092c0e86eef70206dad6287844f33f0312199ab"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
