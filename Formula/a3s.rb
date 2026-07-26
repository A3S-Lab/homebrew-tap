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
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.8/a3s-v0.10.8-aarch64-apple-darwin.tar.gz"
      sha256 "f9f24cd60ffc5e948eb18f5f1c1d78599830daf7577d1eea239ebeffa929dbfd"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.8/a3s-v0.10.8-x86_64-apple-darwin.tar.gz"
      sha256 "71b9f98ed159f6c2fa4e2dca4e8473fbac72527ff73e64d00e0cfe1f7516024c"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    depends_on "socat"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.8/a3s-v0.10.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9836a395ea280e3062905813ad5fdef77dfa7629d214c32f631bda31fcdbc72b"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.8/a3s-v0.10.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3aa0ca5bbfae3e88c2ae3ca50cd2e1a165288c89bbaa760674c1cc49ebafeae3"
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
