class TermStation < Formula
  desc "Persistent terminal workspace with tabs and a draggable dashboard"
  homepage "https://github.com/KMMoonlightQ/term_station"
  url "https://github.com/KMMoonlightQ/term_station/releases/download/v0.1.6/term-station-0.1.6-darwin-arm64.tar.gz"
  version "0.1.6"
  sha256 "6ae74ac644e4a9a674be91dc33e5d2ad49e252b3b5e584f4d8435a724ca103be"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    libexec.install "term-station", "_internal"
    bin.install_symlink libexec/"term-station"
    doc.install "README.md", "THIRD_PARTY_NOTICES.txt", "BUILD_INFO.txt"
  end

  def caveats
    <<~EOS
      Start `term-station` in an interactive terminal.
      Press Ctrl+B, then D to detach and keep your shell sessions running.
      Layout and session state are stored in ~/.local/state/term-station/.
      When upgrading with detached sessions running, keep their old runtime:
        HOMEBREW_NO_INSTALL_CLEANUP=1 brew upgrade KMMoonlightQ/tools/term-station
      Run cleanup only after sessions using older versions have ended.
      UI updates apply after you detach and reopen; sessions keep running.
      When upgrading from 0.1.4 or earlier, the terminal rendering fixes in
      0.1.5 require a new daemon. Save your work before stopping it:
        term-station stop --yes
      This ends all shell sessions in that workspace.
      Then start `term-station` again, or use a separate --state-dir to try it safely.
    EOS
  end

  test do
    assert_match "term-station #{version}", shell_output("#{bin}/term-station --version")
    assert_match "请在交互式终端运行 term-station",
                 shell_output("#{bin}/term-station --state-dir #{testpath}/state </dev/null 2>&1", 2)
  end
end
