class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.2.1/a3s-search-1.2.1-darwin-arm64.tar.gz"
      sha256 "5930568c5bd826b7f3d122ae1960dd3d3b2845d41126d6798669ad9c720e75de"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.2.1/a3s-search-1.2.1-darwin-x86_64.tar.gz"
      sha256 "e7d3b55443002eacdd9bf321e0dd16c1178bbbdc2ed66eb2b7242a0f2eb2c940"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.2.1/a3s-search-1.2.1-linux-arm64.tar.gz"
      sha256 "b35046a49a1ea644b5306c6138d615372a3691249b27a370bca9814b84c27df9"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.2.1/a3s-search-1.2.1-linux-x86_64.tar.gz"
      sha256 "5597c022cfd694de6f03fa01c14239d57d5ca1faa5934069b1854056f34ba499"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
