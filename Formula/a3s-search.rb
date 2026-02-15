class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.5/a3s-search-0.5.5-darwin-arm64.tar.gz"
      sha256 "4b470d531f15cafc3e711eaecf4ad0a57de441c263147943884d3d606f09af41"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.5/a3s-search-0.5.5-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_X86_64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.5/a3s-search-0.5.5-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.5/a3s-search-0.5.5-linux-x86_64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X86_64"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
