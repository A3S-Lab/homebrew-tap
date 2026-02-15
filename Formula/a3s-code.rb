# typed: false
# frozen_string_literal: true

# A3S Code - AI agent with tool execution capabilities
class A3sCode < Formula
  desc "AI agent with tool execution capabilities and gRPC service"
  homepage "https://github.com/A3S-Lab/Code"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Code/releases/download/v0.5.0/a3s-code-0.5.0-darwin-arm64.tar.gz"
      sha256 "07302f94cd148ad62125a207299e80a57b2844bf3599dec1de5b6418445a8ec4"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Code/releases/download/v0.5.0/a3s-code-0.5.0-darwin-x86_64.tar.gz"
      sha256 "197424cf9fc2471a1e02bde3a39fb8d641d80aac21c5807b3316d8f077714987"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Code/releases/download/v0.5.0/a3s-code-0.5.0-linux-arm64.tar.gz"
      sha256 "517b155152559a1ea6cd8925a14fdfba57150a1386f7c81ebb089a0fa3853601"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Code/releases/download/v0.5.0/a3s-code-0.5.0-linux-x86_64.tar.gz"
      sha256 "19b1cef26607135375fc75f6a7f64754ae7da67e2773da5063b69d21e59da012"
    end
  end

  def install
    bin.install "a3s-code"
  end

  service do
    run [opt_bin/"a3s-code", "serve"]
    keep_alive true
    log_path var/"log/a3s-code.log"
    error_log_path var/"log/a3s-code-error.log"
  end

  test do
    system "#{bin}/a3s-code", "--version"
  end
end
