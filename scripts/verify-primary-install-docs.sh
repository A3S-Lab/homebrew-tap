#!/usr/bin/env bash
# Hermetic docs check: primary install path is `brew install a3s`, not a3s-code.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
readme="$root/README.md"
formula_a3s="$root/Formula/a3s.rb"
formula_code="$root/Formula/a3s-code.rb"

grep -Fq 'brew install a3s' "$readme"
grep -Fq 'a3s code' "$readme"
# Primary Installation section must lead with brew install a3s (not only a3s-code).
awk '/^## Installation$/,/^### /{print}' "$readme" | grep -Fq 'brew install a3s'
# Must not present a3s-code as the way to get the `a3s` command.
if grep -Eiq 'brew install a3s-code.*(provides the `a3s`|installs `a3s`|installs the `a3s`)' "$readme"; then
  echo "README must not claim brew install a3s-code provides a3s" >&2
  exit 1
fi
grep -Fq 'brew install a3s' "$formula_code"
grep -Fq 'a3s code' "$formula_a3s"
grep -Fq 'def caveats' "$formula_a3s"
grep -Fq 'The interactive Code TUI is launched with:' "$formula_a3s"
grep -Fq 'bin.install "a3s"' "$formula_a3s" || grep -Fq 'bin.install "a3s", "a3s-webview"' "$formula_a3s"
grep -Fq 'bin.install "a3s-code"' "$formula_code"
echo "verify-primary-install-docs: ok"
