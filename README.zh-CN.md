# A3S Lab 的 Homebrew Tap

<p align="center">
  <strong>语言 / Language:</strong>
  <a href="README.md">English</a> ·
  <a href="README.zh-CN.md">中文</a>
</p>

本仓库包含 A3S Lab 项目的 Homebrew formulae。

## 安装

```bash
brew tap a3s-lab/tap https://github.com/A3S-Lab/homebrew-tap
```

然后安装所需工具：

```bash
# 安装 A3S Box（MicroVM 沙箱运行时）
brew install a3s-box

# 安装 A3S Code（具备工具执行能力的 AI Agent）
brew install a3s-code

# 安装 A3S Search（元搜索引擎）
brew install a3s-search

# 安装 A3S Power（本地模型管理）
brew install a3s-power

# 安装 SafeClaw（安全的个人 AI 助手）
brew install safeclaw
```

### 更新与卸载

```bash
# 更新所有 A3S formulae
brew update && brew upgrade a3s-box a3s-code a3s-search a3s-power

# 卸载某个 formula
brew uninstall a3s-box

# 完全移除该 tap
brew untap a3s-lab/tap
```

## 可用 Formulae

- **`a3s-box`** - 类 Docker 的 MicroVM 运行时，含 55 条命令、实验性 CRI，以及硬件门控的 TEE 工作流
- **`a3s-code`** - 具备工具执行能力与 gRPC 服务的 AI Agent
- **`a3s-search`** - 可嵌入的元搜索引擎 CLI，支持代理池
- **`a3s-power`** - 本地模型管理与服务，提供 OpenAI 兼容 API
- **`safeclaw`** - 支持 TEE 的安全个人 AI 助手

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
│   ├── a3s-box.rb    # A3S Box
│   ├── a3s-code.rb   # A3S Code
│   ├── a3s-power.rb  # A3S Power
│   ├── a3s-search.rb # A3S Search
│   └── safeclaw.rb   # SafeClaw
└── README.md         # 本文件
```

## 开发

本地测试 formula：

```bash
brew install --build-from-source Formula/a3s-code.rb
```

## 许可证

MIT
