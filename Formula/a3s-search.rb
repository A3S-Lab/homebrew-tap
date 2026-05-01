class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.2.3/a3s-search-1.2.3-darwin-arm64.tar.gz"
      sha256 "22a29627d32cc1788eccf77b46c37695f333aa354bc7c3eff3b160b1e21264a2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.2.3/a3s-search-1.2.3-darwin-x86_64.tar.gz"
      sha256 "a51b0348916690dfce70ecdc4119931af0c3073ddd59d51bc0812ac10fbb8d8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.2.3/a3s-search-1.2.3-linux-arm64.tar.gz"
      sha256 "bfc620c549252659cd07533346949352a00954b66c0fb665c7456a935f4113e4"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.2.3/a3s-search-1.2.3-linux-x86_64.tar.gz"
      sha256 "edbbe4961864983a37b2bcfce6a2780d03f2d9ae76018b0efb025c22fc73428c"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
