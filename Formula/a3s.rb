class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "a3s-lab/tap/a3s-webview"
  depends_on "node"
  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.12.4/a3s-v0.12.4-aarch64-apple-darwin.tar.gz"
      sha256 "eb8fd4a36cfb26290abca373469b57b4018318a8256ee37fed12c4f4cd09f488"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.12.4/a3s-v0.12.4-x86_64-apple-darwin.tar.gz"
      sha256 "87db110bd5f826f0c7e1d022b817a7b91d1b5579b4474989b4e7231eef9f9dc8"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    depends_on "socat"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.12.4/a3s-v0.12.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e70a65d30ec4b1b8b56d0f0d50ef6611d3416ee5821d543277c5e307fad18917"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.12.4/a3s-v0.12.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "edb29fb5e7fe90ea8eb067345f2bfecdcbe13e92fd8203fc694f35d56127862a"
    end
  end

  # Homebrew rewrites Node shebangs during keg cleanup. The managed
  # sandbox payload is integrity-checked byte-for-byte at runtime.
  skip_clean "share/a3s/support"

  def install
    bin.install "a3s"
    pkgshare.install "support"
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
