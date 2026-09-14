class GitWorkflow < Formula
  desc "Terminal interface for your GitHub pull request reviews"
  homepage "https://github.com/KMMoonlightQ/git_workflow"
  url "https://github.com/KMMoonlightQ/git_workflow/releases/download/v0.1.1/git_workflow-0.1.1-darwin-arm64.tar.gz"
  version "0.1.1"
  sha256 "54c285082ef11ac92a1c0ec780e4a6e57e258b117e0666da70b49bed607c3d31"

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
