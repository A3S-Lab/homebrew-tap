class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "3.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.6/a3s-box-v3.0.6-macos-arm64.tar.gz"
      sha256 "d8905e0356c4f4d0ab14c9668eec050268d56ce907eb86a5cd1f3bb8cff56141"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.6/a3s-box-v3.0.6-linux-arm64.tar.gz"
      sha256 "61e209ac3ce2455a7810cbb36b315b5693a8fcbde74c6f0a889620e98bd7e2e2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v3.0.6/a3s-box-v3.0.6-linux-x86_64.tar.gz"
      sha256 "36693ac7d60e2fb901eed90eef412a1f0cf778987273c0653706695b5322c914"
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
