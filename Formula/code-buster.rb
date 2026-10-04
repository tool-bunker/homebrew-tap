class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.7.3/code-buster-macos-arm64.tar.gz"
    sha256 "7b8f37b193d75a49952b887a2a153f97ed905b72715c552f960929c7e85812cc"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.7.3/code-buster-linux-x64.tar.gz"
    sha256 "6e65b59e708910cf695ced3734b1d9a0da615a51e150446d9d6013d6f6e730bd"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.7.3", shell_output("#{bin}/cb version")
  end
end
