class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-macos-arm64.tar.gz"
      sha256 "518da5694e9e0f74cc8004df045ccecc4733ea4f76fa6fd325167ae7249b851d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-linux-arm64.tar.gz"
      sha256 "efa8b3f9f6abe8391112470f9267b1fb83106953a306997e21363e3152cb2b86"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-linux-x86_64.tar.gz"
      sha256 "e876ebffdcc05a7bbe056c27f221408c51e76490c44f6a4fa126bc3bce7f957f"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-box-nsexec"
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
