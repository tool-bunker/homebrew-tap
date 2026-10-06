class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.8.0/code-buster-macos-arm64.tar.gz"
    sha256 "411e9fe47c510ecb37e9ff7c88325d62451c0661bb8177c669d942b279af464a"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.8.0/code-buster-linux-x64.tar.gz"
    sha256 "edcc449e9345a2409af4f96a98be01ced2c115f666f0b4e619464234598b866b"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.8.0", shell_output("#{bin}/cb version")
  end
end
