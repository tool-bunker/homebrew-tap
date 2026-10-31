class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.12.0/code-buster-macos-arm64.tar.gz"
    sha256 "580e96203763cb13644a9059da12d953b560a1e50a149fe23a970f63330750a0"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.12.0/code-buster-linux-x64.tar.gz"
    sha256 "65780bd2f6ae054780a370c6cec5efe201b939dae690912691e5287703219a2b"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.12.0", shell_output("#{bin}/cb version")
  end
end
