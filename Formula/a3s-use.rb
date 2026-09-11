class A3sUse < Formula
  desc "Browser, Office, and extensible application capabilities for A3S"
  homepage "https://github.com/A3S-Lab/Use"
  version "0.3.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.3.12/a3s-use-0.3.12-darwin-arm64.tar.gz"
      sha256 "eb44ee8f794467401b1ad92129ed9f58514ef90e42cf2b3d054f880ae1bf0049"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.3.12/a3s-use-0.3.12-darwin-x86_64.tar.gz"
      sha256 "3b3076ca1cdd6b39b25c47f0503aaa10697a612e9ac8c6ed32c5f4773f24553e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.3.12/a3s-use-0.3.12-linux-arm64.tar.gz"
      sha256 "900eb0c9ad2dd42f80706e5e586d4d20cc4ffd85180caa20d8551207607367b8"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.3.12/a3s-use-0.3.12-linux-x86_64.tar.gz"
      sha256 "063abdfb46695fc67bc34b12e0dbe3784fd49d711f06a4343bd30f9bfe701d9b"
    end
  end

  def install
    libexec.install Dir["*"]
    env = {
      A3S_USE_BROWSER_DRIVER:     libexec/"a3s-use-browser-driver",
      A3S_USE_BROWSER_SKILLS_DIR: libexec/"skill-data",
    }
    (bin/"a3s-use").write_env_script libexec/"a3s-use", env
    (bin/"a3s-use-browser-driver").write_env_script libexec/"a3s-use-browser-driver", env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/a3s-use --version")
  end
end
