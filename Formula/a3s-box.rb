class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.7/a3s-box-v0.8.7-macos-arm64.tar.gz"
      sha256 "38fe7a06d5b8ee9bd9548425a3dcf55ac66580ec068cf1bf1d1b4f00086bb102"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.7/a3s-box-v0.8.7-linux-arm64.tar.gz"
      sha256 "3dbb380921aa1e06ba459ebaca889e82c4919414e906fae25eb8c96575cfad1d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.7/a3s-box-v0.8.7-linux-x86_64.tar.gz"
      sha256 "a0e9eab301ccd941255db3428fe3d8a4831861e192f9c9bf416b78d1706324d2"
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
