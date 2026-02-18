class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.8.0/a3s-search-0.8.0-darwin-arm64.tar.gz"
      sha256 "6a2f32b3278cc589508ba5ef59abf6cde8420477165bb436882bd41e8156b735"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.8.0/a3s-search-0.8.0-darwin-x86_64.tar.gz"
      sha256 "f089d00409a916e4016d0c092e3b356f4ef39851eaae6c3ea7ed38e2d3397542"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.8.0/a3s-search-0.8.0-linux-arm64.tar.gz"
      sha256 "91fa0404a845b9ee6456e6a0bbabb1524a060204332d418e436894981d8ea0f9"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.8.0/a3s-search-0.8.0-linux-x86_64.tar.gz"
      sha256 "c188d431b1791e43120e4884a6aef095afe9db164b97744d6feaaeac0ddbef20"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
