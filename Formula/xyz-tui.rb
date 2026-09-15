require_relative "../lib/github_cli_release_download_strategy"

class XyzTui < Formula
  desc "Terminal client for Xiaoyuzhou podcasts"
  homepage "https://github.com/KMMoonlight/xyz_tui"
  url "https://github.com/KMMoonlight/xyz_tui/releases/download/v0.1.0/xyz-tui-0.1.0-darwin-arm64.tar.gz",
      using: KmmGitHubReleaseDownloadStrategy
  version "0.1.0"
  sha256 "a625fcfbe1c7a862b705b71097aac020ed410bda1f096366fa81043a9f17c801"

  depends_on arch: :arm64
  depends_on macos: :sonoma
  depends_on "gh"
  depends_on "mpv"

  livecheck do
    skip "Private GitHub repository"
  end

  def install
    bin.install "xyz-tui" => "xyz"
    bin.install_symlink "xyz" => "xyz-tui"
    doc.install "README.md", "THIRD_PARTY_NOTICES.txt", "BUILD_INFO.txt"
  end

  def caveats
    <<~EOS
      Private release downloads use `gh auth login`; your account needs access to
      KMMoonlight/xyz_tui. No GitHub token is stored in this tap.
      Run `xyz`, then scan its QR code with the Xiaoyuzhou mobile app.
      Press ? for shortcuts, or q to quit. Playback uses the installed mpv.
      Login data is stored in ~/Library/Application Support/xyz-tui/.
      Set XYZ_TUI_STATE_DIR to use a separate data directory.
    EOS
  end

  test do
    assert_match "xyz-tui #{version}", shell_output("#{bin}/xyz --version")
    assert_match "mpv", shell_output("#{bin}/xyz --help")
    assert_match "请在交互式终端中运行",
                 shell_output("#{bin}/xyz </dev/null 2>&1", 1)
  end
end
