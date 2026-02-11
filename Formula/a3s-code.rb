# typed: false
# frozen_string_literal: true

# A3S Code - AI agent with tool execution capabilities
class A3sCode < Formula
  desc "AI agent with tool execution capabilities and gRPC service"
  homepage "https://github.com/A3S-Lab/Code"
  url "https://crates.io/api/v1/crates/a3s-code/0.3.1/download"
  sha256 "e692dd761fce4781613803d89ef37ea186754df06ec5e9e331ea4d88379e6a4d"
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
