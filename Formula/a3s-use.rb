class A3sUse < Formula
  desc "Browser, Office, and extensible application capabilities for A3S"
  homepage "https://github.com/A3S-Lab/Use"
  version "0.3.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.3.11/a3s-use-0.3.11-darwin-arm64.tar.gz"
      sha256 "619ac9945bf80e665fcc59d91193ee129cffc3013ca47a9388e7cf8afb002813"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.3.11/a3s-use-0.3.11-darwin-x86_64.tar.gz"
      sha256 "8f3172b8e85381bfe89316047d218d171b89c052902f945aab0d17f743fd3e3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.3.11/a3s-use-0.3.11-linux-arm64.tar.gz"
      sha256 "1d4ebe4f3b351fe4fccf38515add6d4b0dbaff0ef9fdae6c4286fd81a6867d09"
    end
    on_intel do
      url "https://github.com/A3S-Lab/Use/releases/download/v0.3.11/a3s-use-0.3.11-linux-x86_64.tar.gz"
      sha256 "abf901464ad43c90289b746fa37b30da67d07fdd62c3216bb94f82861a39c21f"
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
    assert_match '"generation"', shell_output(
      "#{bin}/a3s-use capability snapshot --scope-kind user --scope-id user/homebrew-test --json",
    )
  end
end
