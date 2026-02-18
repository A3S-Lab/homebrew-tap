class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.8.0/a3s-search-0.8.0-darwin-arm64.tar.gz"
      sha256 "1d01c30857d93ee73406c9b12ec0717b48ba0760443e3d0c4550431ae28e7177"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.8.0/a3s-search-0.8.0-darwin-x86_64.tar.gz"
      sha256 "44cbc0f80ce892322f26073240c7797b94558113513b9d752f7bd8ce8ccd57f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.8.0/a3s-search-0.8.0-linux-arm64.tar.gz"
      sha256 "b6e7a63270830dc71c456e2f6c463792cd639be425c82d3fe04272d9353e60f9"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.8.0/a3s-search-0.8.0-linux-x86_64.tar.gz"
      sha256 "63d7f6b75a13eb9708242fd83a86d0a82f9725da57ec9c089297fd2ba5865d61"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
