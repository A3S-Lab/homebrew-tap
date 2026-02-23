class A3s < Formula
  desc "Local development orchestration tool for the A3S monorepo"
  homepage "https://github.com/A3S-Lab/Dev"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.2/a3s-0.1.2-darwin-arm64.tar.gz"
      sha256 "186f334b151891a338e4a47055a72c9b0785b53b399ca93ebe1ad227b8c12479"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.2/a3s-0.1.2-darwin-x86_64.tar.gz"
      sha256 "6c7f71ff172fcc7ea31308caf844ccf027a344e23373c3b63a70854a2c5d9afc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.2/a3s-0.1.2-linux-arm64-musl.tar.gz"
      sha256 "dd0d6051b4f04b4ac526315586010ed1583cc668afd9ad86df447c026796872b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Dev/releases/download/v0.1.2/a3s-0.1.2-linux-x86_64-musl.tar.gz"
      sha256 "4f22ca5e3a9c5831b89a60d112055682244ed2b35e281adf08bd5071db01f320"
    end
  end

  def install
    bin.install "a3s"
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
  end
end
