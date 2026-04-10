class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-darwin-arm64.tar.gz"
      sha256 "c97f2afaa4096797eeb4cc836bb0712fa8e77258a037f593701617de7fc72bf9"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-darwin-x86_64.tar.gz"
      sha256 "43f380a0f7a11010a346db9d9e04c3a12112f0a6deb9862b79157846794440fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-linux-arm64.tar.gz"
      sha256 "d296822774a2acff7ae57075d8e57577da412eab860ac5e3c040e1bc2e21b1c8"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.0.0/a3s-search-1.0.0-linux-x86_64.tar.gz"
      sha256 "94e9a11221c4e851cfa9a32072059cd15df30b45669a8bb16abaa85552385098"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
