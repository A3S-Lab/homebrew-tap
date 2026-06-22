class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.5.0/a3s-box-v2.5.0-macos-arm64.tar.gz"
      sha256 "fa50dbc6e18dd4bdb14203955ac2dc19e7443dbdba21843af53f365c881943f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.5.0/a3s-box-v2.5.0-linux-arm64.tar.gz"
      sha256 "fc6ff7a802443506c9633481893a70a8112b7c8b9a90c42452b3d7f5c505593d"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.5.0/a3s-box-v2.5.0-linux-x86_64.tar.gz"
      sha256 "0a62bb72b892b77ada2bca43f5b07b9300f4e1f25e41316fd9392d49514f504c"
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
