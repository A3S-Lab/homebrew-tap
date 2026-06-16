class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/AI45Lab/Box"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.3.0/a3s-box-v2.3.0-macos-arm64.tar.gz"
      sha256 "73d176b0660c59044c068b39603854c40212ff2d5779caadcbbad76e80178d06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AI45Lab/Box/releases/download/v2.3.0/a3s-box-v2.3.0-linux-arm64.tar.gz"
      sha256 "80d905610ed965c21d130da25ab58193177a46cd7f82834b26ab684b4294e077"
    end
    on_intel do
      url "https://github.com/AI45Lab/Box/releases/download/v2.3.0/a3s-box-v2.3.0-linux-x86_64.tar.gz"
      sha256 "c0435dad0fa62c7b3e886f8e1bc5bfeb9c909abc91265496e74493d64ce1ee4e"
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
