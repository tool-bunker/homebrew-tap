class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.11.0/code-buster-macos-arm64.tar.gz"
    sha256 "7b99db8e57a855f116659a6fe9df292b300a0e0a0f63fd09565a1f779eb8ce39"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.11.0/code-buster-linux-x64.tar.gz"
    sha256 "c46af688d3bcd1f9418235a2bb0421f119edf4cd184be70fa85f57b0c79ed746"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.11.0", shell_output("#{bin}/cb version")
  end
end
