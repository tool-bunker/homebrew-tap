class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.14.3/code-buster-macos-arm64.tar.gz"
    sha256 "40cea81c13e7b20e78913e700a51c7722f0ecacd3899ec333adb610c811a6fda"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.14.3/code-buster-linux-x64.tar.gz"
    sha256 "4c4d685bfbaa5a98c83843ba6c68510e3bef4d9a9ea8d0182174b586b5599259"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.14.3", shell_output("#{bin}/cb version")
  end
end
