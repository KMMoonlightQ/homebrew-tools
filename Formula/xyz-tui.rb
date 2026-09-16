class XyzTui < Formula
  desc "Terminal client for Xiaoyuzhou podcasts"
  homepage "https://github.com/KMMoonlight/xyz_tui"
  url "https://github.com/KMMoonlight/xyz_tui/releases/download/v0.1.1/xyz-tui-0.1.1-darwin-arm64.tar.gz"
  version "0.1.1"
  sha256 "d4d3cd39a839b4cd22df30b8c2bf286db7498608110bcdb35f58d19ad91def4b"

  depends_on arch: :arm64
  depends_on macos: :sonoma
  depends_on "mpv"

  def install
    bin.install "xyz-tui" => "xyz"
    bin.install_symlink "xyz" => "xyz-tui"
    doc.install "README.md", "THIRD_PARTY_NOTICES.txt", "BUILD_INFO.txt"
  end

  def caveats
    <<~EOS
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
