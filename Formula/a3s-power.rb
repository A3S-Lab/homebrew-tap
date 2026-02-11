class A3sPower < Formula
  desc "Local model management and serving with OpenAI-compatible API"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.2/a3s-power-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "4c519d64ed540f6e34170a894137538f0deb0a96533f53b4433cb029ff9c5478"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.2/a3s-power-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "5a88f8134ac234a6007c92a8e09aea34fe1fe538214fed189e62f77f441f9833"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.2/a3s-power-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9c1da6d762f8db66593d429562810206832c10098e7978277bf0fefbd891e68"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.1.2/a3s-power-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5467d98cd3b48090e708ad7886f4be126eab1e9b9304c544a74e35de4cd8cbb"
    end
  end

  def install
    bin.install "a3s-power"
  end

  test do
    assert_match "a3s-power", shell_output("#{bin}/a3s-power --version")
  end
end
