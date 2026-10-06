class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.7.5/code-buster-macos-arm64.tar.gz"
    sha256 "86915711b6dec83a7d661c73848fb97786f317e02136226d364d059dfb14849e"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.7.5/code-buster-linux-x64.tar.gz"
    sha256 "20172726c6d82c237cd3caba2306fde2387d6be561900f8075e7e4a56a129c92"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.7.5", shell_output("#{bin}/cb version")
  end
end
