# A3S Lab 的 Homebrew Tap

<p align="center">
  <strong>语言 / Language:</strong>
  <a href="README.md">English</a> ·
  <a href="README.zh-CN.md">中文</a>
</p>

本仓库包含 A3S Lab 项目的 Homebrew formulae。

## 安装

安装伞形 CLI（提供 `a3s` 二进制；交互式 Code TUI 使用 `a3s code`）：

```bash
brew tap a3s-lab/tap https://github.com/A3S-Lab/homebrew-tap
brew install a3s
a3s --version
a3s code
```

### 其他 formulae

```bash
# MicroVM 沙箱运行时
brew install a3s-box

# 元搜索引擎
brew install a3s-search

# 本地模型管理
brew install a3s-power

# 安全的个人 AI 助手
brew install safeclaw
```

### 遗留 / 已弃用：`a3s-code`

`brew install a3s-code` 安装的是**遗留**的独立 `a3s-code` 二进制（当前为 0.6.0）。它**不会**安装 `a3s`。

当前伞形 CLI 与 TUI 请使用：

```bash
brew install a3s
a3s code
```

### 更新与卸载

```bash
# 更新 formulae
brew update && brew upgrade a3s a3s-box a3s-search a3s-power

# 卸载某个 formula
brew uninstall a3s

# 完全移除该 tap
brew untap a3s-lab/tap
```

## 可用 Formulae

### 主入口

- **`a3s`** — 伞形 CLI（`a3s` 二进制）。交互式 Code TUI 运行 `a3s code`。

### 其他

- **`a3s-box`** — 类 Docker 的 MicroVM 运行时，含硬件门控 TEE 工作流
- **`a3s-search`** — 可嵌入的元搜索引擎 CLI，支持代理池
- **`a3s-power`** — 本地模型管理与服务，提供 OpenAI 兼容 API
- **`safeclaw`** — 支持 TEE 的安全个人 AI 助手

### 遗留 / 已弃用

- **`a3s-code`** — 遗留独立 `a3s-code` 二进制（不是 `a3s`）。请改用 `brew install a3s` 与 `a3s code`。

### a3s-search 用法

```bash
# 基础搜索
a3s-search "Rust programming"

# 指定引擎
a3s-search "Rust" -e ddg,wiki,baidu

# JSON 输出
a3s-search "Rust" -f json

# 使用代理
a3s-search "Rust" -p socks5://127.0.0.1:1080

# 列出可用引擎
a3s-search engines
```

## 仓库结构

```
homebrew-tap/
├── Formula/           # Homebrew formula 文件
│   ├── a3s.rb         # 伞形 CLI（主入口）
│   ├── a3s-box.rb     # A3S Box
│   ├── a3s-code.rb    # 遗留 a3s-code 二进制
│   ├── a3s-power.rb   # A3S Power
│   ├── a3s-search.rb  # A3S Search
│   └── safeclaw.rb    # SafeClaw
├── Casks/
│   └── safeclaw.rb
└── README.md
```

## 开发

本地测试 formula：

```bash
brew install --build-from-source Formula/a3s.rb
```

## 许可证

MIT
