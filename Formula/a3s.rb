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
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.3/a3s-v0.10.3-aarch64-apple-darwin.tar.gz"
      sha256 "5043778329c28079f8fcfcb94e5be94d876a3dc1bc2550712cc6b135b4e34fa2"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.3/a3s-v0.10.3-x86_64-apple-darwin.tar.gz"
      sha256 "48c326e977656bda01635fcb5549f675745be5c8c5c09a718e445f013d5c51df"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    depends_on "socat"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.3/a3s-v0.10.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e575816ecef09b12b48cd92445e3105415fcfd03efef9cea4cf44af5ea6fb1fe"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.10.3/a3s-v0.10.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "779f9066c1ba1b11b145fab1a83edd6e8d0781324affa57620bfc640b941cd52"
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
