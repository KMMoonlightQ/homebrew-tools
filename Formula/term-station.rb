class TermStation < Formula
  desc "Persistent terminal workspace with tabs and a draggable dashboard"
  homepage "https://github.com/KMMoonlightQ/term_station"
  url "https://github.com/KMMoonlightQ/term_station/releases/download/v0.1.1/term-station-0.1.1-darwin-arm64.tar.gz"
  version "0.1.1"
  sha256 "275e45406bea64fc05b28a74bbeac4b79605aa4eb0d807306fd0fa16c8c57f7e"

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
    EOS
  end

  test do
    assert_match "term-station #{version}", shell_output("#{bin}/term-station --version")
    assert_match "请在交互式终端运行 term-station",
                 shell_output("#{bin}/term-station --state-dir #{testpath}/state </dev/null 2>&1", 2)
  end
end
