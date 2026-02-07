# Homebrew Tap for A3S Lab

This repository contains Homebrew formulae for A3S Lab projects.

## Installation

```bash
brew tap A3S-Lab/tap
```

Then install the tools you need:

```bash
# Install A3S Code (AI agent with tool execution)
brew install a3s-code

# Install A3S Tools (built-in tools binary)
brew install a3s-tools

# Install A3S Search (meta search engine)
brew install a3s-search

# Install A3S Power (local model management)
brew install a3s-power

# Install SafeClaw (secure personal AI assistant)
brew install safeclaw
```

## Available Formulae

- **`a3s-code`** - AI agent with tool execution capabilities and gRPC service
- **`a3s-tools`** - Built-in tools binary (bash, read, write, edit, grep, glob, ls, cron)
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
│   ├── a3s-code.rb   # A3S Code
│   ├── a3s-tools.rb  # A3S Tools
│   ├── a3s-search.rb # A3S Search
│   ├── a3s-power.rb  # A3S Power
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
