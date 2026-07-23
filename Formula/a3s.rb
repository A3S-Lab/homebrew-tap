require "digest"

class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "a3s-lab/tap/a3s-webview"
  depends_on "node"
  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.2/a3s-v0.10.2-aarch64-apple-darwin.tar.gz"
      sha256 "c7bff09ec09fc87afa4ff503da8a0e52724c935f834780aadade9a486b33374e"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.2/a3s-v0.10.2-x86_64-apple-darwin.tar.gz"
      sha256 "3287f88d86f5005ec390181b5e3a56a922dd26287effb7f1ab94b6c4f1035e3b"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    depends_on "socat"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.2/a3s-v0.10.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f84c01701cab29c11a6bc1109efd29ee0fcadd5a1761684a0e9e57c621637a98"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.2/a3s-v0.10.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d78030883c6aa8663e65d4b7dd6f42c271227859bb794264c2d56ec9531de734"
    end
  end

  # Homebrew rewrites Node shebangs during keg cleanup. The managed
  # sandbox payload is integrity-checked byte-for-byte at runtime.
  skip_clean "share/a3s/support"

  def install
    bin.install "a3s"
    pkgshare.install "web", "support"
  end

  def post_install
    managed_srt = pkgshare/"support/managed-srt"
    rewritten_shebang = "#!#{formula_opt_bin("node")}/node"
    managed_srt.glob("**/*").each do |path|
      next unless path.file?
      next if path.open("rb") { |file| file.read(rewritten_shebang.bytesize) } != rewritten_shebang

      inreplace path, /\A#{Regexp.escape(rewritten_shebang)}/, "#!/usr/bin/env node"
    end
  end

  test do
    assert_match "a3s", shell_output("#{bin}/a3s --version")
    assert_path_exists pkgshare/"web/index.html"
    managed_srt = pkgshare/"support/managed-srt"
    expected = (pkgshare/"support/managed-srt.tree-sha256").read.strip
    digest = Digest::SHA256.new
    hash_field = lambda do |value|
      bytes = value.b
      digest << [bytes.bytesize].pack("Q<") << bytes
    end
    hash_directory = lambda do |directory, relative_directory|
      directory.children.sort_by { |path| path.basename.to_s.b }.each do |path|
        name = path.basename.to_s
        relative = relative_directory.empty? ? name : "#{relative_directory}/#{name}"
        refute_predicate path, :symlink?
        if path.directory?
          digest << "dir\0"
          hash_field.call(relative)
          hash_directory.call(path, relative)
        else
          assert_predicate path, :file?
          digest << "file\0"
          hash_field.call(relative)
          digest << path.binread << "\0"
        end
      end
    end
    hash_directory.call(managed_srt, "")
    assert_equal expected, digest.hexdigest
  end
end
