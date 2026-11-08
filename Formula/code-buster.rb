class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.14.1/code-buster-macos-arm64.tar.gz"
    sha256 "751fa2ae67d7708a70fa8aaaf550875756aac7cc20a8c718dbaf4c7a642c4692"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.14.1/code-buster-linux-x64.tar.gz"
    sha256 "9aa60df70342fc4c022b3a6cbc2eb238c04b85fcb42e3b9f6ef8db6287a65646"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.14.1", shell_output("#{bin}/cb version")
  end
end
