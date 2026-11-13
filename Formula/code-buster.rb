class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.14.4/code-buster-macos-arm64.tar.gz"
    sha256 "32c8c1d98aee40168bafeea8e9f247aaa60033009dc4b1ee10a5bfab7a6f531a"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.14.4/code-buster-linux-x64.tar.gz"
    sha256 "f924835faa404798bd797ad0c11f9af6af32381086c6b69b1e9b5c8211a6592a"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.14.4", shell_output("#{bin}/cb version")
  end
end
