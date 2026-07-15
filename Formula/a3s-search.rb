class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.3/a3s-search-1.4.3-darwin-arm64.tar.gz"
      sha256 "8e8c3fd98757ddc0daf2a621ce7523b31daf4b1a291c356df278d004cea0e0be"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.3/a3s-search-1.4.3-darwin-x86_64.tar.gz"
      sha256 "0796d15e7756cf56068d0f501719c7267f57426f53ed98da7a89f926b88ab67e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.3/a3s-search-1.4.3-linux-arm64.tar.gz"
      sha256 "683379097fd16815d2692e45f58ba7cb43616941d33e66a57bd67718a6abfff0"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.4.3/a3s-search-1.4.3-linux-x86_64.tar.gz"
      sha256 "4070feba1e6f1f7dfbbfddee6d88ae2c679fa7804828be6860d58b641ef73abd"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
