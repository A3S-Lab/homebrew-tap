class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.6.0/a3s-search-0.6.0-darwin-arm64.tar.gz"
      sha256 "cd610af41ddf4464c82a8018fa62f8e1b9650de398349b3ee9c31ef82c17dcdd"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.6.0/a3s-search-0.6.0-darwin-x86_64.tar.gz"
      sha256 "bccf1b8262d9bd92df18eaec1560eb3ad57ecb28190d18059c09f5ba04745948"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.6.0/a3s-search-0.6.0-linux-arm64.tar.gz"
      sha256 "3caa1bc4eaa14fbb86bc602c8861a9097e6a3f6465aeb79dab52cdcd405ea7bb"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.6.0/a3s-search-0.6.0-linux-x86_64.tar.gz"
      sha256 "ffbd46cb5c6b92687f636f420c181fbd84e8982a7824d8a032a8f19192e3f8f7"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
