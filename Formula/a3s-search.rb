class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-darwin-arm64.tar.gz"
      sha256 "ddd947e81d563c2612a4e4769f44b09990174636673853badb6ccb730cff2e61"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-darwin-x86_64.tar.gz"
      sha256 "45d29df92e8dbd926cd8538520a2ac0126e5450e42848caa33d5d1ea008ca35b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-linux-arm64.tar.gz"
      sha256 "fbd3ce5b17ee6f9d19c97e6903e6dfb42e9df1bed9470ccc0ce6232955a11b7d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-linux-x86_64.tar.gz"
      sha256 "7ccda466971195e4a990668150c7dc68045b88e000c08a617b98197b871be571"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
