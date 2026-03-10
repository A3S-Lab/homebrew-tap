# typed: false
# frozen_string_literal: true

cask "safeclaw" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/A3S-Lab/a3s/releases/download/safeclaw-v#{version}/SafeClaw_#{version}_universal.dmg"
  name "SafeClaw"
  desc "Secure personal AI assistant with TEE support"
  homepage "https://github.com/A3S-Lab/a3s"

  depends_on macos: ">= :ventura"

  app "SafeClaw.app"

  zap trash: [
    "~/Library/Application Support/com.a3s.safeclaw",
    "~/Library/Caches/com.a3s.safeclaw",
    "~/Library/Preferences/com.a3s.safeclaw.plist",
    "~/Library/Logs/com.a3s.safeclaw",
  ]
end
