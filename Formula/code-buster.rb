class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.3.0/code-buster-macos-arm64.tar.gz"
    sha256 "12e879cf6f61cf6a54457bf5f20455810cbc3484f940684d63e96b2dbdfac570"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.3.0/code-buster-linux-x64.tar.gz"
    sha256 "4259ad721cb66b52cd56f8a7f196168aed12bec2057c08ae65e7c199fbfb72f3"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.3.0", shell_output("#{bin}/cb version")
  end
end
