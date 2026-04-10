class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-darwin-arm64.tar.gz"
      sha256 "098404d7acb2844a50ba221624084e5c12a2196ea393a51e49e99d08e738c017"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-darwin-x86_64.tar.gz"
      sha256 "c4d4b2201c714957b1075d29b392a9609f4e628d337e25666e1017d51d21cf21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-linux-arm64.tar.gz"
      sha256 "21a89c0169ea32a82f0b6f157de99792c2f7468e1e58834cad8d140152c01599"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-linux-x86_64.tar.gz"
      sha256 "21421fbfe15bf1a21d1b777d9de0906d73c3b9bd460e35fbfbc742c785109101"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
