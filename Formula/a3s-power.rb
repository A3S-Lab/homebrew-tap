class A3sPower < Formula
  desc "Privacy-preserving LLM inference for TEE environments"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.3/a3s-power-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "99d42334a431f0205b4396f94be4cab0fbfe4416ba00cf9c70fe45f488114737"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.3/a3s-power-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "92d967da83f5dec9b989fad70a5449e04c384f9a9381f89b8d9c602b1d2646a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.3/a3s-power-v0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9572e72b070c5444b1b1ebfec2ec2932ccc1415f5eb8fae6732ebfa31c101df1"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.4.3/a3s-power-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a95765d5fbf154568939f90d10b99ebb441e9689d0d4fcc38bdd319a7013fd9d"
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
