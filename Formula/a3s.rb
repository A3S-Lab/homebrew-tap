class A3s < Formula
  desc "Coding agent CLI — a3s code launches the interactive TUI"
  homepage "https://github.com/A3S-Lab/CLI"
  license all_of: ["MIT", "Apache-2.0", "BSD-3-Clause"]
  depends_on "a3s-lab/tap/a3s-webview"

  on_macos do
    # Homebrew no longer supports Monterey and attempts to build
    # current Node dependencies from source there. Keep the A3S
    # binary installable, and direct macOS 12 users to MacPorts for
    # the sandbox prerequisites in  below.
    on_ventura :or_newer do
      depends_on "node"
      depends_on "ripgrep"
    end
    on_monterey :or_older do
      define_method(:caveats) do
        <<~EOS
          Homebrew no longer supports macOS 12 and may fail while building
          current Node.js dependencies from source. A3S itself is installed
          from the official Intel archive. For the complete local command
          sandbox, install Node.js 20.11+ and ripgrep with MacPorts:

            sudo port install nodejs22 ripgrep
            sudo port select --set node nodejs22
        EOS
      end
    end
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.13.5/a3s-v0.13.5-aarch64-apple-darwin.tar.gz"
      sha256 "749ad4d3fee2526dcf392cfab813aa608f79dde2155907bd3a2de7c0ea380e11"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.13.5/a3s-v0.13.5-x86_64-apple-darwin.tar.gz"
      sha256 "2b2180a7dcdcd8251334906fe07abb28c53d061e8ac8f3d09235773ef707e0d8"
    end
  end

  on_linux do
    depends_on "bubblewrap"
    depends_on "node"
    depends_on "ripgrep"
    depends_on "socat"
    on_arm do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.13.5/a3s-v0.13.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d0d29faee32ac466f6f7dd18e539076bf82056a76ae672402068f52271d1215d"
    end
    on_intel do
      url "https://github.com/A3S-Lab/CLI/releases/download/v0.13.5/a3s-v0.13.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f41a71f073e7bc901db5c38d382b600d6f23a64a09705eeecc25590bbde5fd53"
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
