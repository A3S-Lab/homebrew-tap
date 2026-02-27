class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.7.0/a3s-box-v0.7.0-macos-arm64.tar.gz"
      sha256 "0bfd848d35f282f1f8fad2f1c9401e0fcab502d5d51b139ec3f7736fc7e02617"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.7.0/a3s-box-v0.7.0-linux-arm64.tar.gz"
      sha256 "352007965caa37832539be4c090726e41e0ce49df9db226743ef5b64bfb16191"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.7.0/a3s-box-v0.7.0-linux-x86_64.tar.gz"
      sha256 "dc49fdef17ec303b49e71159ffa310a7d7c3803a221b569d565a279f34572467"
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
