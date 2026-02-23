class A3sGateway < Formula
  desc "High-performance Traefik-inspired reverse proxy and API gateway"
  homepage "https://github.com/A3S-Lab/Gateway"
  url "https://crates.io/api/v1/crates/a3s-gateway/0.2.2/download"
  sha256 "885b190c4210514e72574a771a1290c78702b1f82b46aed61adc5cc5733a1306"
  version "0.2.2"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "a3s-gateway", shell_output("#{bin}/a3s-gateway --version")
  end
end
