# Homebrew Tools

KMMoonlightQ 自用软件的 Homebrew 安装仓库。

## 安装

安装 [Homebrew](https://brew.sh/) 后，执行：

```sh
brew install KMMoonlightQ/tools/pr-review
pr-review
```

首次使用 GitHub CLI 时，先运行一次 `gh auth login`。Homebrew 会自动安装 `gh` 依赖。

## 软件

| 软件 | 命令 | 源码 | 平台 |
| --- | --- | --- | --- |
| PR Review | `pr-review` | [git_workflow](https://github.com/KMMoonlightQ/git_workflow) | macOS Apple Silicon（arm64） |

PR Review 在终端中显示 GitHub PR Review 列表，复用本机 `gh` 登录。安装包内含 Bun 运行时和 OpenTUI 原生库，无需另装 Node.js 或 Bun。需要交互式终端；按 `q` 退出。

## 更新

```sh
brew update
brew upgrade KMMoonlightQ/tools/pr-review
```

## 发布新版本

1. 在软件源码仓库运行测试并构建，给确定的提交发布版本与安装包。
2. 更新 `Formula/pr-review.rb` 中的版本、下载地址和 SHA256。
3. 运行 `brew reinstall KMMoonlightQ/tools/pr-review` 和 `brew test KMMoonlightQ/tools/pr-review`，验证后提交并推送安装规则。

源码和安装包保留在软件自己的仓库；本仓库只保存 Homebrew 安装规则。
