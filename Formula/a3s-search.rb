class A3sSearch < Formula
  desc "Embeddable meta search engine CLI with proxy pool support"
  homepage "https://github.com/A3S-Lab/Search"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-darwin-arm64.tar.gz"
      sha256 "8f753c63ded23bf950bb46c4a96ea06dbf0387da8f06f695da8a75841f312017"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-darwin-x86_64.tar.gz"
      sha256 "117b8678c9205728df1e32dd34cb4bfec0847a1f6c4b7384ac5dc0bf445386a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-linux-arm64.tar.gz"
      sha256 "5d60a0148b18fa18613c19428d40b728c3f58e2bb0e9505ac5fef08fcda45b0d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Search/releases/download/v0.9.0/a3s-search-0.9.0-linux-x86_64.tar.gz"
      sha256 "4761c217d59552c17d2721049ac6d5402d92c242f7e9f0b9ceafb2192b02b83a"
    end
  end

  def install
    bin.install "a3s-search"
  end

  test do
    assert_match "a3s-search", shell_output("#{bin}/a3s-search --version")
  end
end
