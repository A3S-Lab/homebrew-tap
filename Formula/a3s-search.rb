class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.0/a3s-search-1.4.0-darwin-arm64.tar.gz"
      sha256 "bca19318f599890249a746e1d82f42fe50608b90a2fb2233c8309f3696f7a754"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.0/a3s-search-1.4.0-darwin-x86_64.tar.gz"
      sha256 "50b2676ac8b71806bfdac06ba1afb29377556470331d1ce20f1fae0dace84a50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.0/a3s-search-1.4.0-linux-arm64.tar.gz"
      sha256 "cfc99ae1ad479df9e2b114c9a668ef988adc00c9cff671c9458f4e50d2ff999f"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.0/a3s-search-1.4.0-linux-x86_64.tar.gz"
      sha256 "f4c9361236bebf9924c4df0e61d83ad836604f433989046e6ee733875fee2ac7"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
