# Homebrew Tap for A3S Lab

<p align="center">
  <strong>Language / 语言:</strong>
  <a href="README.md">English</a> ·
  <a href="README.zh-CN.md">中文</a>
</p>

This repository contains Homebrew formulae for A3S Lab projects.

## Installation

Install the umbrella CLI (provides the `a3s` binary; interactive Code TUI via `a3s code`):

```bash
brew tap a3s-lab/tap https://github.com/A3S-Lab/homebrew-tap
brew install a3s
a3s --version
a3s code
```

### Other formulae

```bash
# MicroVM sandbox runtime
brew install a3s-box

# Meta search engine
brew install a3s-search

# Local model management
brew install a3s-power

# Secure personal AI assistant
brew install safeclaw
```

### Legacy / deprecated: `a3s-code`

`brew install a3s-code` installs the **legacy** standalone `a3s-code` binary (currently 0.6.0). It does **not** install `a3s`.

For the current umbrella CLI and TUI, use:

```bash
brew install a3s
a3s code
```

### Migrating from older installs

Old `a3s` releases depended on a separate `a3s-webview` formula; current `a3s`
ships `a3s-webview` in the same keg. Keeping both causes symlink failures.
Prefer the unified installer (auto-cleans conflicts):

```bash
curl --proto '=https' --tlsv1.2 -LsSf \
  https://raw.githubusercontent.com/A3S-Lab/a3s/main/install.sh | sh
```

Or clean manually, then install only `a3s`:

```bash
brew uninstall a3s-code 2>/dev/null || true
brew uninstall a3s-webview 2>/dev/null || true
brew uninstall --force a3s 2>/dev/null || true
brew install a3s-lab/tap/a3s
```

Do not keep a separate `a3s-webview` formula installed beside umbrella `a3s`.

### Update & Uninstall

```bash
# Update formulae
brew update && brew upgrade a3s a3s-box a3s-search a3s-power

# Uninstall a formula
brew uninstall a3s

# Remove the tap entirely
brew untap a3s-lab/tap
```

## Available Formulae

### Primary

- **`a3s`** — Umbrella CLI (`a3s` binary). Run `a3s code` for the interactive Code TUI.

### Other

- **`a3s-box`** — Docker-like MicroVM runtime with hardware-gated TEE workflows
- **`a3s-search`** — Embeddable meta search engine CLI with proxy pool support
- **`a3s-power`** — Local model management and serving with OpenAI-compatible API
- **`safeclaw`** — Secure Personal AI Assistant with TEE Support

### Legacy / deprecated

- **`a3s-code`** — Legacy standalone `a3s-code` binary (not `a3s`). Prefer `brew install a3s` and `a3s code`.

### a3s-search Usage

```bash
# Basic search
a3s-search "Rust programming"

# With specific engines
a3s-search "Rust" -e ddg,wiki,baidu

# JSON output
a3s-search "Rust" -f json

# With proxy
a3s-search "Rust" -p socks5://127.0.0.1:1080

# List available engines
a3s-search engines
```

## Repository Structure

```
homebrew-tap/
├── Formula/           # Homebrew formula files
│   ├── a3s.rb         # Umbrella CLI (primary)
│   ├── a3s-box.rb     # A3S Box
│   ├── a3s-code.rb    # Legacy a3s-code binary
│   ├── a3s-power.rb   # A3S Power
│   ├── a3s-search.rb  # A3S Search
│   └── safeclaw.rb    # SafeClaw
├── Casks/
│   └── safeclaw.rb
└── README.md
```

## Development

To test formulas locally:

```bash
brew install --build-from-source Formula/a3s.rb
```

## License

MIT
