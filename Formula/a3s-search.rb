class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.2/a3s-search-0.5.2-darwin-arm64.tar.gz"
      sha256 "9f5aa27d52dbe62b804ddc62d9e9ffa8d8662e7856c5c51edb37a06dd5515147"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.2/a3s-search-0.5.2-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER_X86_64_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.2/a3s-search-0.5.2-linux-arm64.tar.gz"
      sha256 "1f757d6c7ed936b8b328fdadd44ec7107feb0f3f07a89a49fd1212f9441b7957"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.5.2/a3s-search-0.5.2-linux-x86_64.tar.gz"
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
