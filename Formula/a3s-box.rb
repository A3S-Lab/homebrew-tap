class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.8.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.12/a3s-box-v0.8.12-macos-arm64.tar.gz"
      sha256 "64cd35b4562b0514f0394342cce32c665637fbcf3fbebc92f88b7f0d4c3cffa0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.12/a3s-box-v0.8.12-linux-arm64.tar.gz"
      sha256 "7f386c1a62967a41e606bc5abcb223c61ebd2e35cb919aed8959d9ffca9a2cf5"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.8.12/a3s-box-v0.8.12-linux-x86_64.tar.gz"
      sha256 "b7f649e4571b8c1c3e9007d8044509f93179a10cdc85a68af48e7e877e8932c0"
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
