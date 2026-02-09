# typed: false
# frozen_string_literal: true

# A3S Code - AI agent with tool execution capabilities
class A3sCode < Formula
  desc "AI agent with tool execution capabilities and gRPC service"
  homepage "https://github.com/A3S-Lab/Code"
  url "https://crates.io/api/v1/crates/a3s-code/0.2.0/download"
  sha256 "3444d21a55742b9df9124ddf7992deb44864578aa5acf56fd9378ff3c0dce99a"
  license "MIT"

  depends_on "rust" => :build
  depends_on "protobuf" => :build

  def install
    system "cargo", "install", *std_cargo_args
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
