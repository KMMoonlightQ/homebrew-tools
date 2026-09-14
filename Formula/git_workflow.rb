class GitWorkflow < Formula
  desc "Terminal interface for your GitHub pull request reviews"
  homepage "https://github.com/KMMoonlightQ/git_workflow"
  url "https://github.com/KMMoonlightQ/git_workflow/releases/download/v0.1.2/git_workflow-0.1.2-darwin-arm64.tar.gz"
  version "0.1.2"
  sha256 "2a28f7136d2e5d63bb60c7041cd8d7bc40580e94f5629e252c1b7dae2bf0d2ce"

  depends_on arch: :arm64
  depends_on macos: :ventura
  depends_on "gh"

  def install
    bin.install "git_workflow"
    doc.install "README.md", "THIRD_PARTY_NOTICES.txt"
  end

  def caveats
    <<~EOS
      Run `gh auth login` if you have not signed in to GitHub CLI.
      Start `git_workflow` in an interactive terminal. Press q to quit.
    EOS
  end

  test do
    assert_match "请在交互式终端中运行此程序",
                 shell_output("#{bin}/git_workflow </dev/null 2>&1", 1)
  end
end
