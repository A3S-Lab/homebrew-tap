class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.5/a3s-box-v3.2.5-macos-arm64.tar.gz"
      sha256 "26278f02124b9f6078e6ff99c2701d37a5cef5798562495cca3ce34d04db6030"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.5/a3s-box-v3.2.5-linux-arm64.tar.gz"
      sha256 "cdeaa17aea167016a5c2b109f8a018f4c62136300b349f1da65e28fb7fa296ba"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.5/a3s-box-v3.2.5-linux-x86_64.tar.gz"
      sha256 "33df2462ed0fe0db1359e5d37d47c440746417e3d97b51c7f795c0375af1dca5"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-oci" if File.exist?("a3s-oci")
    bin.install "a3s-oci-agent" if File.exist?("a3s-oci-agent")
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
    lib.install Dir["lib/*"] if Dir.exist?("lib")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
