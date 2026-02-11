class A3sPower < Formula
  desc "Local model management and serving with OpenAI-compatible API"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.4/a3s-power-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "b9cda0625998c62af23bccd04df9756dfda45b5ba63cbb51e11f0785a7624ac3"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.4/a3s-power-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "00c691900777d4d0039107961d22aaa6d7538d6be37b50f986997129dd5215ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.4/a3s-power-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d8d7add487909be1693537f37c1a1c6cdd7dac0f4c868ec27a46bcf128186e8d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.4/a3s-power-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ccc43185c6bb276007704c6cce5ac8b0f638f420664254944fd3e4b22617b38b"
    end
  end

  def install
    bin.install "a3s-power"
  end

  test do
    assert_match "a3s-power", shell_output("#{bin}/a3s-power --version")
  end
end
