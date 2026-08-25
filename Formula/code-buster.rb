class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  version "0.2.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.2.0/code-buster-macos-arm64.tar.gz"
    sha256 "db5e8813ba9d0abd950750c230978596f791d72441ef88cd6ce93630c655e768"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.2.0/code-buster-linux-x64.tar.gz"
    sha256 "c787e55136bf327bb42a361ef7650ad4868082e83919206f0b12f96c9007d5e9"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.2.0", shell_output("#{bin}/cb version")
  end
end
