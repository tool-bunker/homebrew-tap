class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.7.1/code-buster-macos-arm64.tar.gz"
    sha256 "165e055f5747887678df575aeacb7c8f97247256cbccb78183c47430f2ff0f5a"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.7.1/code-buster-linux-x64.tar.gz"
    sha256 "a4fb571b6b5e8b5d0911c03db8901737598fd721f5f00c9b8500604255ebb014"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.7.1", shell_output("#{bin}/cb version")
  end
end
