class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.13.0/code-buster-macos-arm64.tar.gz"
    sha256 "a74c44cd14dc6043155debb23ec3204281cbc8966abdec69622b000143bb48bb"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.13.0/code-buster-linux-x64.tar.gz"
    sha256 "7e93975e757572cef40d885897b6bfdfd3f0dd11d99bebc2a8be2e742dca2115"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.13.0", shell_output("#{bin}/cb version")
  end
end
