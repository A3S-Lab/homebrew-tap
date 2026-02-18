# Homebrew Tap for A3S Lab

This repository contains Homebrew formulae for A3S Lab projects.

## Installation

```bash
brew tap a3s-lab/tap https://github.com/A3S-Lab/homebrew-tap
```

Then install the tools you need:

```bash
# Install A3S Box (MicroVM sandbox runtime)
brew install a3s-box

# Install A3S Code (AI agent with tool execution)
brew install a3s-code

# Install A3S Search (meta search engine)
brew install a3s-search

# Install A3S Power (local model management)
brew install a3s-power

# Install SafeClaw (secure personal AI assistant)
brew install safeclaw
```

### Update & Uninstall

```bash
# Update all A3S formulae
brew update && brew upgrade a3s-box a3s-code a3s-search a3s-power

# Uninstall a formula
brew uninstall a3s-box

# Remove the tap entirely
brew untap a3s-lab/tap
```

## Available Formulae

- **`a3s-box`** - MicroVM sandbox runtime with TEE support (Docker-like CLI, 52 commands)
- **`a3s-code`** - AI agent with tool execution capabilities and gRPC service
- **`a3s-search`** - Embeddable meta search engine CLI with proxy pool support
- **`a3s-power`** - Local model management and serving with OpenAI-compatible API
- **`safeclaw`** - Secure Personal AI Assistant with TEE Support

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
│   ├── a3s-box.rb    # A3S Box
│   ├── a3s-code.rb   # A3S Code
│   ├── a3s-power.rb  # A3S Power
│   ├── a3s-search.rb # A3S Search
│   └── safeclaw.rb   # SafeClaw
└── README.md         # This file
```

## Development

To test formulas locally:

```bash
brew install --build-from-source Formula/a3s-code.rb
```

## License

MIT
