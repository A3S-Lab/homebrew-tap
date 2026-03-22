class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.14/a3s-box-v0.8.14-macos-arm64.tar.gz"
      sha256 "1fb7698a6678a439257f34d3ade4e36b358af80fbf214e161c8ce73040598f68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.14/a3s-box-v0.8.14-linux-arm64.tar.gz"
      sha256 "bb4d4a0d5636dad3eb3b3ae2f8c532b5fc5c2f4382ab17161c87a67ab43317e1"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.14/a3s-box-v0.8.14-linux-x86_64.tar.gz"
      sha256 "b3a2a95be5e826139fafe766dc778821512ae5b9044228ce041ef4d8cd789adf"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
    lib.install Dir["lib/*"] if Dir.exist?("lib")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
