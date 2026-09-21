class Koala < Formula
  desc "Extensible terminal AI agent"
  homepage "https://github.com/KMMoonlightQ/koala"
  url "https://github.com/KMMoonlightQ/koala/releases/download/v0.1.0/koala-0.1.0-darwin-arm64.tar.gz"
  version "0.1.0"
  sha256 "0bd09f4bebb214b6437e0298dc988db4cd9728983f21d017f0b446e43c85ab2a"

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
      Configure your provider before sending a message:
        mkdir -p ~/.koala
        cp -n #{share}/koala/config.example.toml ~/.koala/config.toml
      Edit [llm] base_url, api_key and model in ~/.koala/config.toml.
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
