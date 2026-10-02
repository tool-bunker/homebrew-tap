class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.7.2/code-buster-macos-arm64.tar.gz"
    sha256 "fc91b29f57d2ebc3573146489f68ec6454462ce09d1a50ecc61a1eeb882f7117"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.7.2/code-buster-linux-x64.tar.gz"
    sha256 "245897d3498f767b3fea64a897c447aabce4bc6bd18f41d9565f06e1803cc7d8"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.7.2", shell_output("#{bin}/cb version")
  end
end
