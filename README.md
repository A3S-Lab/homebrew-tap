# Homebrew Tap for A3S Lab

This repository contains Homebrew formulae for A3S Lab projects.

## Installation

```bash
brew tap A3S-Lab/tap
```

## Available Formulae

### a3s-search

Embeddable meta search engine CLI with proxy pool support.

```bash
brew install a3s-search
```

#### Usage

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

## License

MIT
