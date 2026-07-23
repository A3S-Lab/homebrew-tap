class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.1.0/a3s-box-v3.1.0-macos-arm64.tar.gz"
      sha256 "4f1c248e785be55b8ccab8acca19ad089b38b1d5b115eeaed144a5437fb200b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.1.0/a3s-box-v3.1.0-linux-arm64.tar.gz"
      sha256 "2420b5f5c46bc773856f7a07a3525c80f61946a81127033770e7d340b9b277cd"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.1.0/a3s-box-v3.1.0-linux-x86_64.tar.gz"
      sha256 "d1aa83dc0111f8982a8ac984064fd4e8cf553deb87a94f28ad85b9f1da9af530"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
    bin.install "a3s-box-e2b" if File.exist?("a3s-box-e2b")
    lib.install Dir["lib/*"] if Dir.exist?("lib")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
