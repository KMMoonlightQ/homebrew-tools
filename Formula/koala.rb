class Koala < Formula
  desc "Extensible terminal AI agent"
  homepage "https://github.com/KMMoonlightQ/koala"
  url "https://github.com/KMMoonlightQ/koala/releases/download/v0.1.1/koala-0.1.1-darwin-arm64.tar.gz"
  version "0.1.1"
  sha256 "aaab4cebe3670964f0a02e5e07c4513bc92d86eab2122f50c22b8a06c364eb10"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "koala"
    (share/"koala").install "config.example.toml"
    doc.install "README.md", "THIRD_PARTY_NOTICES.txt", "BUILD_INFO.txt"
  end

  def caveats
    <<~EOS
      Run `koala` to open the interactive terminal app.
      On first launch, follow the connection setup form and press Ctrl+S to save.
      Configuration is stored in ~/.koala/config.toml.
      Existing config and sessions are preserved during upgrades.
      Use /quit to exit, or Ctrl+D with an empty input in the main view.
    EOS
  end

  test do
    ENV["HOME"] = testpath
    assert_match "koala #{version}", shell_output("#{bin}/koala --version")
    assert_match "chat", shell_output("#{bin}/koala --help")
    assert_path_exists share/"koala/config.example.toml"
    refute_path_exists testpath/".koala"
  end
end
