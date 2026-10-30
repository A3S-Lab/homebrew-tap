class A3sPower < Formula
  desc "Model-neutral verifiable inference for confidential systems"
  homepage "https://github.com/A3S-Lab/Power"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.11.0/a3s-power-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "b5f98cd68ef166f563f970b72aa204d43d213e4d12e346cf6bec7fd657ac51cb"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.11.0/a3s-power-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "163adc076aae16996e034f6124b5f5331b5d5c009dcf19df069ff963b8e5b4a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.11.0/a3s-power-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "646820fbd770a9a9bd9c21626b6b42dc37d9d9ca6736e6df2098b71d1a2c7f94"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Power/releases/download/v0.11.0/a3s-power-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff8563f771f496aedd3102e5691d41acab64b3668d662772a452f25e3bf8e6bf"
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
