class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.14.2/code-buster-macos-arm64.tar.gz"
    sha256 "7435dc7a8c35ee6c8e040f433e36985028933520c474ff93ea14b274f8c113f5"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.14.2/code-buster-linux-x64.tar.gz"
    sha256 "72dc2fa88366fff7f0ad973105ff16d660b8ebc16c6a71e35f507ed94f1046a8"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.14.2", shell_output("#{bin}/cb version")
  end
end
