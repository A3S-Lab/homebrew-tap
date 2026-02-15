# typed: false
# frozen_string_literal: true

# A3S Code - AI agent with tool execution capabilities
class A3sCode < Formula
  desc "AI agent with tool execution capabilities and gRPC service"
  homepage "https://github.com/A3S-Lab/Code"
  url "https://crates.io/api/v1/crates/a3s-code/0.4.7/download"
  sha256 "2d580d47d36b0f0a50c0a2394d5f9eb7273087cb8120e0175bde22031df934c8"
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
