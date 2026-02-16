class A3sBox < Formula
  desc "MicroVM sandbox runtime with TEE support"
  homepage "https://github.com/A3S-Lab/Box"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-macos-arm64.tar.gz"
      sha256 "04a95f2ecb5550a24ee32530983bee48604aedf00a5f4cbae9daca31a3165240"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-linux-arm64.tar.gz"
      sha256 "2c912b449e09342a9e84af0ddb8749f04a94414740e93a62abd859d35863242f"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Box/releases/download/v0.3.0/a3s-box-v0.3.0-linux-x86_64.tar.gz"
      sha256 "aaa0433093d03ee60c5d21774eaf1cbda42545e53b6a61bc67e37dbbd7d006d7"
    end
  end

  def install
    bin.install "a3s-box"
    bin.install "a3s-box-shim"
    bin.install "a3s-box-guest-init"
    bin.install "a3s-box-nsexec"
    bin.install "a3s-box-cri" if File.exist?("a3s-box-cri")
  end

  test do
    assert_match "a3s-box", shell_output("#{bin}/a3s-box --version")
  end
end
