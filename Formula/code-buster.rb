class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.14.0/code-buster-macos-arm64.tar.gz"
    sha256 "2030f750a6c7a80c097a484fb6fc94f7c5c684d3ae872279b896c1bd1e0ec548"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.14.0/code-buster-linux-x64.tar.gz"
    sha256 "01c63728e8226b0e2095b3efd4efe7254bbd57ebc0403cf8ca6900df06385f8b"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.14.0", shell_output("#{bin}/cb version")
  end
end
