# typed: false
# frozen_string_literal: true

# A3S Tools - Built-in tools binary for A3S agents
class A3sTools < Formula
  desc "Built-in tools binary for A3S agents (bash, read, write, edit, grep, glob, ls, cron)"
  homepage "https://github.com/A3S-Lab/Tools"
  url "https://crates.io/api/v1/crates/a3s-tools/0.1.3/download"
  sha256 "dbc81454a286d341e4861ff5d27a77ac150868ae8b69a2f975ca2af4bada17b3"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/a3s-tools", "--help"
  end
end
