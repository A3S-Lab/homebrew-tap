class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-darwin-arm64.tar.gz"
      sha256 "f097cac34fe800876bcab0664e1e1cd6dbbedc372581b3b1e06da09fccfcd711"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-darwin-x86_64.tar.gz"
      sha256 "e111bc477b72af836a85d3cb76a971fc9b3abfe7c17fdb79392f31cf89797139"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-linux-arm64.tar.gz"
      sha256 "27763e00fe001c6941496c58497e0f0748f023aa3a9f12a448656a68e939cd76"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-linux-x86_64.tar.gz"
      sha256 "4baaa2fea5593b025d24262c3ee6aad5c00ea561eaa6f4b341eb0b51b993ba71"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
