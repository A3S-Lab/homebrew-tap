class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.3.0/a3s-search-1.3.0-darwin-arm64.tar.gz"
      sha256 "b3c4fe06a4cddcac8912434555a58735c20f8dd6472e50423343e82c6599a1b4"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.3.0/a3s-search-1.3.0-darwin-x86_64.tar.gz"
      sha256 "e3fe9cf85b8074d8f94edc7491dc43f3f8537f7fd6e709077a912e9cfc4dcc4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.3.0/a3s-search-1.3.0-linux-arm64.tar.gz"
      sha256 "98232933f07d437664c36da17e87d3d5741591fe0bdf77f0c49b74667504ca76"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.3.0/a3s-search-1.3.0-linux-x86_64.tar.gz"
      sha256 "4dac30d70f470ea70cd080b11ff4991c15599484aa83bce8f7b1584d74469fb3"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
