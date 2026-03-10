class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.5/a3s-box-v0.8.5-macos-arm64.tar.gz"
      sha256 "0cfd0d9b3b369c254a9b1f65abb47265ad434fbc7176b82a881305c93716bb14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.5/a3s-box-v0.8.5-linux-arm64.tar.gz"
      sha256 "0c5d5bb76392352a5001791fc14bb2f36c56493f126f17826362fca7bd70d689"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.5/a3s-box-v0.8.5-linux-x86_64.tar.gz"
      sha256 "a75ff100478d410c55c1bdde05654cc6654b14a495ab5f763eafcc75278f4585"
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
