class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-darwin-arm64.tar.gz"
      sha256 "1443d7cbf798ed24c2f8f937318a02e4445a6bd5a16d2e40157f732a0d93d59c"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-darwin-x86_64.tar.gz"
      sha256 "43fa2cd2a8cecb9c006d36e6ebbb4683da8992e9da59ef3a6ccd255f81f6a010"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-linux-arm64.tar.gz"
      sha256 "7e3ebfdd6afad15b10458b445a393faadaeebe83514da6c5619d044711f0a4ed"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-linux-x86_64.tar.gz"
      sha256 "9b4a007063b688aae7581d726c415b2930667b4e36ca1e08d3260f6f96ab0e1e"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
