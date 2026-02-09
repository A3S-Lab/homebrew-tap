class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.0/a3s-search-0.5.0-darwin-arm64.tar.gz"
      sha256 "e76d0901386790919d3804464315ed75926b235563d914d1bf25c45ae1d09c4d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.0/a3s-search-0.5.0-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER_X86_64_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.0/a3s-search-0.5.0-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.0/a3s-search-0.5.0-linux-x86_64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X86_64_SHA256"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "A3S Search", shell_output("#{bin}/a3s-search --version")
  end
end
