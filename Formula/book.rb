class Book < Formula
  desc "Terminal ebook reader for TXT, EPUB and MOBI"
  homepage "https://github.com/KMMoonlightQ/book"
  url "https://github.com/KMMoonlightQ/book/releases/download/v0.1.1/book-0.1.1-darwin-arm64.tar.gz"
  version "0.1.1"
  sha256 "64fb4eef039bd12e529bd2856b2ba07ce0a11297919531977ba52ea11440d682"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "book"
    doc.install "README.md", "THIRD_PARTY_NOTICES.txt", "BUILD_INFO.txt"
  end

  def caveats
    <<~EOS
      Run `book` in an interactive terminal. The first launch creates
      ~/.config/book.toml and ~/books, then exits with setup instructions.
      Add books to ~/books, or edit library_dir in the config, then run book again.
      Press i while reading to select a chapter.
      Press Esc to save reading progress and return to the library, then q to quit.
      Reading progress is stored in ~/.config/book-progress.toml.
      BOOK_CONFIG_DIR can select a separate config and progress directory.
    EOS
  end

  test do
    ENV["BOOK_CONFIG_DIR"] = testpath/"config"
    assert_match "book #{version}", shell_output("#{bin}/book --version")
    assert_match "EPUB", shell_output("#{bin}/book --help")
    assert_match "请在交互式终端中运行",
                 shell_output("#{bin}/book </dev/null 2>&1", 1)
    refute_path_exists testpath/"config"
  end
end
