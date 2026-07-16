class A3sUse < Formula
  desc "Browser, Office, and extensible application capabilities for A3S"
  homepage "https://github.com/A3S-Lab/Use"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.1.1/a3s-use-0.1.1-darwin-arm64.tar.gz"
      sha256 "5759f1ed4a310469f61eef6aad8629e16d766b206fb29f90159b70db23e189dc"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.1.1/a3s-use-0.1.1-darwin-x86_64.tar.gz"
      sha256 "f6d3df1274e55e55de7fb98542c7bf50bac880fb5d21dde0ff3f0122431a4842"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.1.1/a3s-use-0.1.1-linux-arm64.tar.gz"
      sha256 "204e360e44c7f053f9a0a8608b9edb28712775f40c16738c6820c8130db42c20"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.1.1/a3s-use-0.1.1-linux-x86_64.tar.gz"
      sha256 "f13a6f75023a5f77458dbe55fc83c196e3e38e62eb6f72baa1ae973e3a7234c9"
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
    assert_match '"name":"core"', shell_output("#{bin}/a3s-use browser skills list --json")
    assert_match '"skills"', shell_output("#{bin}/a3s-use capability snapshot --json")
  end
end
