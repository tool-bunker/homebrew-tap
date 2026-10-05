class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.7.4/code-buster-macos-arm64.tar.gz"
    sha256 "8181411e0479ae9c714d33588150cc5f7293f14cf5d3b4cafa965474b04641cc"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.7.4/code-buster-linux-x64.tar.gz"
    sha256 "c89b2372aaa7457dcf52569958c812ded519f5805eb42bfc491bc78729dfb551"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.7.4", shell_output("#{bin}/cb version")
  end
end
