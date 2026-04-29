class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-darwin-arm64.tar.gz"
      sha256 "ef2ac04f22a9432bea86e5474151ff8bda166c02816eac91def80e00793a82d6"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-darwin-x86_64.tar.gz"
      sha256 "51a45ddca9c0780d0bdba783f0dde8d68ff806cde11e07622a47b63963a4b96e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-linux-arm64.tar.gz"
      sha256 "b2cf3fbb8d03580b710c377db20c3ecf76c79f9739be126fdd384c8a874c8768"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v1.1.0/a3s-search-1.1.0-linux-x86_64.tar.gz"
      sha256 "8d5e377d48c57aa0fe3374209bc13e40cd3202555638640b749b4d36e715eb8e"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
