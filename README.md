# Homebrew Tools

KMMoonlightQ 自用软件的 Homebrew 安装仓库。

## 安装

安装 [Homebrew](https://brew.sh/) 后，执行：

```sh
brew install KMMoonlightQ/tools/git_workflow
git_workflow
```

首次使用 GitHub CLI 时，先运行一次 `gh auth login`。Homebrew 会自动安装 `gh` 依赖。

## 软件

| 软件 | 命令 | 源码 | 平台 |
| --- | --- | --- | --- |
| git_workflow | `git_workflow` | [git_workflow](https://github.com/KMMoonlightQ/git_workflow) | macOS Apple Silicon（arm64） |

git_workflow 在终端中显示 GitHub git_workflow 列表，复用本机 `gh` 登录。安装包内含 Bun 运行时和 OpenTUI 原生库，无需另装 Node.js 或 Bun。需要交互式终端；按 `q` 退出。

## 更新

```sh
brew update
brew upgrade KMMoonlightQ/tools/git_workflow
```

## 发布新版本

维护安装规则时，进入 Homebrew 实际使用的仓库：

```sh
cd "$(brew --repository KMMoonlightQ/tools)"
```

1. 在软件源码仓库运行测试并构建，给确定的提交发布版本与安装包。
2. 更新 `Formula/git_workflow.rb` 中的版本、下载地址和 SHA256。
3. 运行 `brew reinstall KMMoonlightQ/tools/git_workflow` 和 `brew test KMMoonlightQ/tools/git_workflow`，验证后提交并推送安装规则。

源码和安装包保留在软件自己的仓库；本仓库只保存 Homebrew 安装规则。

## 从旧名称迁移

`pr-review` 已改名为 `git_workflow`，本仓库包含 Homebrew 改名映射。更新后使用新命令：

```sh
brew update
brew install KMMoonlightQ/tools/git_workflow
brew migrate KMMoonlightQ/tools/git_workflow
brew upgrade KMMoonlightQ/tools/git_workflow
git_workflow
```
