class PrReview < Formula
  desc "Terminal interface for your GitHub pull request reviews"
  homepage "https://github.com/KMMoonlightQ/git_workflow"
  url "https://github.com/KMMoonlightQ/git_workflow/releases/download/v0.1.0/pr-review-0.1.0-darwin-arm64.tar.gz"
  version "0.1.0"
  sha256 "208d905b298db3591be17b3294340bbe60eba2da12d9aea5b8abf9f4dbe2a126"

  depends_on arch: :arm64
  depends_on macos: :ventura
  depends_on "gh"

  def install
    bin.install "pr-review"
    doc.install "README.md", "THIRD_PARTY_NOTICES.txt"
  end

  def caveats
    <<~EOS
      Run `gh auth login` if you have not signed in to GitHub CLI.
      Start `pr-review` in an interactive terminal. Press q to quit.
    EOS
  end

  test do
    assert_match "请在交互式终端中运行此程序",
                 shell_output("#{bin}/pr-review </dev/null 2>&1", 1)
  end
end
