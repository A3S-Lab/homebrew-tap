class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.7/a3s-box-v3.2.7-macos-arm64.tar.gz"
      sha256 "8cb399cbbff907318d4d4d61426ea54cb7de9edfba7c432f132c383ab1b945eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.7/a3s-box-v3.2.7-linux-arm64.tar.gz"
      sha256 "dbd029a4be5a77b14dff5e049f86775438c529c3ec014fa52ee266c2b7e55d9a"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.2.7/a3s-box-v3.2.7-linux-x86_64.tar.gz"
      sha256 "c7ee4031443d82f5f27cce64becf3a00b8ffe5827e95dae6366bd1b47e3017e9"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-oci" if File.exist?("a3s-oci")
    bin.install "a3s-oci-agent" if File.exist?("a3s-oci-agent")
    bin.install "a3s-box-sandbox-oci-launcher" if File.exist?("a3s-box-sandbox-oci-launcher")
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
    lib.install Dir["lib/*"] if Dir.exist?("lib")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
