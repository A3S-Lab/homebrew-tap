# typed: false
# frozen_string_literal: true

# SafeClaw - Secure Personal AI Assistant with TEE Support
class Safeclaw < Formula
  desc "Secure Personal AI Assistant with TEE Support"
  homepage "https://github.com/A3S-Lab/SafeClaw"
  url "https://github.com/A3S-Lab/SafeClaw/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "TODO"
  license "MIT"

  depends_on "rust" => :build
  depends_on "protobuf" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/safeclaw", "--version"
  end
end
