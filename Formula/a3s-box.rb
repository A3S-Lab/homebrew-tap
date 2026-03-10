class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.1/a3s-box-v0.8.1-macos-arm64.tar.gz"
      sha256 "cfe8d65fc6636a54dc4acc312ae3360f9b573750450c7fa7626055551ecf55b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.1/a3s-box-v0.8.1-linux-arm64.tar.gz"
      sha256 "4af76d127fbd3314b1f2d4d974817f686407caac1fec9a4823acf267356fefcf"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.1/a3s-box-v0.8.1-linux-x86_64.tar.gz"
      sha256 "7dd0b2a661ed79c0dd7f8ca21022ea4a5dc3d1d0e16d745ea2c0d0c23058a423"
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
