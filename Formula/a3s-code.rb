class A3sCode < Formula
  desc "AI coding agent with tool execution and gRPC service"
  homepage "https://github.com/A3S-Lab/Code"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Code/releases/download/v0.6.0/a3s-code-0.6.0-darwin-arm64.tar.gz"
      sha256 "cd55bb8b0f55fb46941c9c5df74445682f85251f343cfd9de4ce22414178d9fd"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Code/releases/download/v0.6.0/a3s-code-0.6.0-darwin-x86_64.tar.gz"
      sha256 "42ffb023db569c6822aa635f70de9f4503cab04253b592ad28f7046cdb9c313d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Code/releases/download/v0.6.0/a3s-code-0.6.0-linux-arm64.tar.gz"
      sha256 "c3c14beced6675093e7b9006a57b492f3fd6ff67e353240522b2a265920a54cf"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Code/releases/download/v0.6.0/a3s-code-0.6.0-linux-x86_64.tar.gz"
      sha256 "727580c9fcd0e1bb323a410929a98d23cd6d558e1f1026b50f96c0cb9651a243"
    end
  end

  def install
    bin.install "a3s-code"
  end

  test do
    assert_match "a3s-code", shell_output("#{bin}/a3s-code --version")
  end
end
