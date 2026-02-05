# Homebrew Tap for A3S Lab

This repository contains Homebrew formulae for A3S Lab projects.

## Installation

```bash
brew tap A3S-Lab/tap
```

Then install the tools you need:

```bash
# Install A3S core CLI
brew install a3s

# Install A3S Code (Claude Code integration)
brew install a3s-code

# Install A3S Box (sandbox runtime)
brew install a3s-box

# Install A3S Tools (built-in tools binary)
brew install a3s-tools

# Install A3S Search (meta search engine)
brew install a3s-search
```

## Available Formulae

- **`a3s`** - A3S core CLI tool for managing autonomous agent systems
- **`a3s-code`** - A3S Code integration for Claude Code
- **`a3s-box`** - A3S Box sandbox runtime for secure agent execution
- **`a3s-tools`** - Built-in tools binary (bash, read, write, edit, grep, glob, ls, cron)
- **`a3s-search`** - Embeddable meta search engine CLI with proxy pool support

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
│   ├── a3s.rb        # A3S core CLI
│   ├── a3s-code.rb   # A3S Code
│   ├── a3s-box.rb    # A3S Box
│   ├── a3s-tools.rb  # A3S Tools
│   └── a3s-search.rb # A3S Search
└── README.md         # This file
```

## Development

To test formulas locally:

```bash
brew install --build-from-source Formula/a3s.rb
```

## License

MIT
