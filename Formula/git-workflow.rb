class GitWorkflow < Formula
  desc "Terminal interface for your GitHub pull request reviews"
  homepage "https://github.com/KMMoonlightQ/git_workflow"
  url "https://github.com/KMMoonlightQ/git_workflow/releases/download/v0.1.3/git-workflow-0.1.3-darwin-arm64.tar.gz"
  version "0.1.3"
  sha256 "b0fed0644c4ef6d7b92610d5dbb0bd47a345649b9c9549e1a2a7fe393e0b8269"

  depends_on arch: :arm64
  depends_on macos: :ventura
  depends_on "gh"

  def install
    bin.install "git-workflow"
    bin.install_symlink "git-workflow" => "git_workflow"
    doc.install "README.md", "THIRD_PARTY_NOTICES.txt"
  end

  def caveats
    <<~EOS
      Run `gh auth login` if you have not signed in to GitHub CLI.
      Start `git-workflow` in an interactive terminal. Press q to quit.
    EOS
  end

  test do
    assert_match "请在交互式终端中运行此程序",
                 shell_output("#{bin}/git-workflow </dev/null 2>&1", 1)
  end
end
