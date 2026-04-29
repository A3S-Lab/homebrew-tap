class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-darwin-arm64.tar.gz"
      sha256 "d8acd9a19cb9c163bae5d074aed8e1c2b789bc0fe23ff49d3fe2153e3f8a886a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-darwin-x86_64.tar.gz"
      sha256 "a6972dabb99c173914044c4dcadb1958435822a88ef83a149840f109b89f23b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-linux-arm64.tar.gz"
      sha256 "525c1fda2a7129028f5bba133d36077243c82651c235e86eb23ab3540f8a3130"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-linux-x86_64.tar.gz"
      sha256 "8ebb232ab3cd94deb531a3805f4771da545a6669e87214b5a4a1734516f94d2a"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
