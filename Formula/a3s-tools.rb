# typed: false
# frozen_string_literal: true

# A3S Tools - Built-in tools binary for A3S agents
class A3sTools < Formula
  desc "Built-in tools binary for A3S agents (bash, read, write, edit, grep, glob, ls, cron)"
  homepage "https://github.com/A3S-Lab/Tools"
  url "https://github.com/A3S-Lab/Tools/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "TODO"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/a3s-tools", "--help"
  end
end
