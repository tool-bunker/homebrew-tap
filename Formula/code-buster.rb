class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.8.1/code-buster-macos-arm64.tar.gz"
    sha256 "2320719724021fd47012992912dc11c97c969c96e2472c06a8ac7ca6afae0976"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.8.1/code-buster-linux-x64.tar.gz"
    sha256 "25390c99260f727ffec7bf2e769d6ec97462fdefb6f18745aed54d7359b71675"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.8.1", shell_output("#{bin}/cb version")
  end
end
