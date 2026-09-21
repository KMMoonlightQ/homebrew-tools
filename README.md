# Homebrew Tools

KMMoonlightQ 软件的 Homebrew 安装仓库。

所有软件的源码和安装包均已公开，安装无需 GitHub 登录或仓库授权。

## 安装

安装 [Homebrew](https://brew.sh/) 后，执行：

```sh
brew install KMMoonlightQ/tools/git-workflow KMMoonlightQ/tools/term-station KMMoonlightQ/tools/xyz-tui KMMoonlightQ/tools/book KMMoonlightQ/tools/koala
```

也可以只安装需要的软件。安装后分别运行 `git-workflow`、`term-station`、`xyz`、`book` 或 `koala`。git-workflow 查询你的 GitHub PR 时仍需先执行 `gh auth login`；这是使用其功能的要求，安装包本身可匿名下载。Homebrew 会自动安装它需要的 `gh` 依赖。

## 软件

| 软件 | 命令 | 源码 | 平台 |
| --- | --- | --- | --- |
| git-workflow | `git-workflow` | [git_workflow](https://github.com/KMMoonlightQ/git_workflow) | macOS Apple Silicon（arm64） |
| Term Station | `term-station` | [term_station](https://github.com/KMMoonlightQ/term_station) | macOS 14+，Apple Silicon（arm64） |
| xyz-tui | `xyz` | [xyz_tui](https://github.com/KMMoonlight/xyz_tui) | macOS 14+，Apple Silicon（arm64） |
| koala | `koala` | [koala](https://github.com/KMMoonlightQ/koala) | macOS 14+，Apple Silicon（arm64） |
| book | `book` | [book](https://github.com/KMMoonlightQ/book) | macOS 14+，Apple Silicon（arm64） |

git-workflow 在终端中显示 GitHub PR Review 列表，复用本机 `gh` 登录。安装包内含 Bun 运行时和 OpenTUI 原生库，无需另装 Node.js 或 Bun。需要交互式终端；按 `q` 退出。

Term Station 提供多 Tab 和持久 Shell 会话，无需另装 Python。程序与依赖以目录形式一起安装，减少重复解包带来的启动等待。按 `Ctrl+B` 再按 `D` 保存并离开界面，后台会话继续运行；重新运行 `term-station` 即可接回。

## 安装 xyz-tui

xyz-tui 是小宇宙播客终端客户端。源码和安装包均已公开，安装无需 GitHub 登录或仓库授权。

```sh
brew install KMMoonlightQ/tools/xyz-tui
xyz
```

Homebrew 自动安装播放依赖 `mpv`，无需 Rust。安装后使用 `xyz` 启动，再用小宇宙 App 扫码登录；按 `?` 查看快捷键，按 `q` 退出。查看版本使用 `xyz --version`，`xyz-tui` 也保留为兼容入口。

更新使用 `brew update` 和 `brew upgrade KMMoonlightQ/tools/xyz-tui`。

## 安装 book

book 是本地电子书终端阅读器，支持 TXT、EPUB 和未加密的 PalmDOC MOBI。源码和安装包均已公开，无需 Rust、GitHub 登录或仓库授权即可安装。

```sh
brew install KMMoonlightQ/tools/book KMMoonlightQ/tools/koala
book
```

首次启动生成 `~/.config/book.toml` 和 `~/books`，然后退出。将书籍放入 `~/books`，或修改配置中的 `library_dir`，再次运行 `book`。已有配置会继续保留。

书架中按 ↑/↓ 或 j/k 选择，Enter 打开；阅读时按 ←/→ 或 p/n 翻页，按 i 打开章节目录，Esc 保存进度并返回书架，再按 q 退出。阅读页底部显示当前章节进度。更新使用 `brew update` 和 `brew upgrade KMMoonlightQ/tools/book`。

## 安装 koala

koala 是终端 AI Agent，无需 Rust。安装并打开：

```sh
brew install KMMoonlightQ/tools/koala
koala
```

使用模型前，将 `$(brew --prefix koala)/share/koala/config.example.toml` 复制到
`~/.koala/config.toml`（已有文件请保留），填写 `[llm]` 的 `base_url`、`api_key`、`model`。
输入 `/quit` 退出；升级保留已有配置和会话。

## 更新

```sh
brew update
HOMEBREW_NO_INSTALL_CLEANUP=1 brew upgrade KMMoonlightQ/tools/git-workflow KMMoonlightQ/tools/term-station KMMoonlightQ/tools/xyz-tui KMMoonlightQ/tools/book KMMoonlightQ/tools/koala
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

`pr-review` 和 `git_workflow` 均已改名为 `git-workflow`。本仓库包含 Homebrew 改名映射，更新时会迁移安装记录；仍保留 `git_workflow` 命令作为同一 Homebrew 安装的兼容入口。

```sh
brew update
brew upgrade KMMoonlightQ/tools/git-workflow
git-workflow
```

如果 Homebrew 提示需手动迁移，可执行 `brew migrate git_workflow` 后再升级。

## Term Station 后台升级

鼠标转发需要新版界面和新版后台。升级软件后重新打开界面，仍会连接现有后台，以保留运行中的会话。保存工作后，执行 `term-station stop --yes` 再启动即可使用新版后台；该命令会结束当前工作空间的所有终端会话。使用另一个 `--state-dir` 可以先体验新版并保留原有会话。
