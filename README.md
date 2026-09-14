# Homebrew Tools

KMMoonlightQ 自用软件的 Homebrew 安装仓库。

## 安装

安装 [Homebrew](https://brew.sh/) 后，执行：

```sh
brew install KMMoonlightQ/tools/git_workflow KMMoonlightQ/tools/term-station
```

安装后分别运行 `git_workflow` 或 `term-station`。git_workflow 首次使用 GitHub CLI 时，先运行一次 `gh auth login`；Homebrew 会自动安装它需要的 `gh` 依赖。

## 软件

| 软件 | 命令 | 源码 | 平台 |
| --- | --- | --- | --- |
| git_workflow | `git_workflow` | [git_workflow](https://github.com/KMMoonlightQ/git_workflow) | macOS Apple Silicon（arm64） |
| Term Station | `term-station` | [term_station](https://github.com/KMMoonlightQ/term_station) | macOS 14+，Apple Silicon（arm64） |

git_workflow 在终端中显示 GitHub PR Review 列表，复用本机 `gh` 登录。安装包内含 Bun 运行时和 OpenTUI 原生库，无需另装 Node.js 或 Bun。需要交互式终端；按 `q` 退出。

Term Station 提供多 Tab 和持久 Shell 会话，无需另装 Python。程序与依赖以目录形式一起安装，减少重复解包带来的启动等待。按 `Ctrl+B` 再按 `D` 保存并离开界面，后台会话继续运行；重新运行 `term-station` 即可接回。

## 更新

```sh
brew update
HOMEBREW_NO_INSTALL_CLEANUP=1 brew upgrade KMMoonlightQ/tools/git_workflow KMMoonlightQ/tools/term-station
```

上述命令保留旧版本目录，供仍在运行的 Term Station 后台使用。旧后台会话结束后，再清理它使用的旧版本目录。

## 发布新版本

维护安装规则时，进入 Homebrew 实际使用的仓库：

```sh
cd "$(brew --repository KMMoonlightQ/tools)"
```

1. 在软件源码仓库运行测试并构建，给确定的提交发布版本与安装包。
2. 更新对应 `Formula/*.rb` 中的版本、下载地址和 SHA256。
3. 对相应包运行 `brew reinstall KMMoonlightQ/tools/包名` 和 `brew test KMMoonlightQ/tools/包名`，验证后提交并推送安装规则。

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
