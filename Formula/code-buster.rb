class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.9.0/code-buster-macos-arm64.tar.gz"
    sha256 "76c49e62cb91dec9f76735ec301938e58c212e4a8da2e542afdc842762c8ee76"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.9.0/code-buster-linux-x64.tar.gz"
    sha256 "ec61b2e5a8d7678ca1d9d7ec05238d0343795f484f26b0bdc4ffd00d916f62e0"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.9.0", shell_output("#{bin}/cb version")
  end
end
