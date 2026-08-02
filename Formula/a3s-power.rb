class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.4/a3s-power-v0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "0c28e3721c7911d7f54e56aee5005b7ec67f3461bcf94affdbe73fd743627c71"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.4/a3s-power-v0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "0bedf3b60c1a7356f5cd5ce2e06267b531aa173e9bf611268baf9ab944f601f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.4/a3s-power-v0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c38446e6910eeebb1c253d894e56d804ff2594e3c9ecf401fb996526ad32c563"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.4/a3s-power-v0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "021bd0abd0690758f4b75155748a5a0e70c73c597c27df8d2245631bea6ba8f9"
    end
  end

  def install
    bin.install "a3s-power"
    bin.install "a3s-power-verify"
  end

  test do
    assert_match "a3s-power", shell_output("#{bin}/a3s-power --version")
  end
end
