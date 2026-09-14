class TermStation < Formula
  desc "Persistent terminal workspace with tabs and a draggable dashboard"
  homepage "https://github.com/KMMoonlightQ/term_station"
  url "https://github.com/KMMoonlightQ/term_station/releases/download/v0.1.0/term-station-0.1.0-darwin-arm64.tar.gz"
  version "0.1.0"
  sha256 "5ba6227e02d959b57a0dc5fd22d43c74f49e28b1ed25610d05626330387e1409"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "term-station"
    doc.install "README.md", "THIRD_PARTY_NOTICES.txt", "BUILD_INFO.txt"
  end

  def caveats
    <<~EOS
      Start `term-station` in an interactive terminal.
      Press Ctrl+B, then D to detach and keep your shell sessions running.
      Layout and session state are stored in ~/.local/state/term-station/.
    EOS
  end

  test do
    assert_match "term-station #{version}", shell_output("#{bin}/term-station --version")
    assert_match "请在交互式终端运行 term-station",
                 shell_output("#{bin}/term-station --state-dir #{testpath}/state </dev/null 2>&1", 2)
  end
end
