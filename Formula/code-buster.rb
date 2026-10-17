class CodeBuster < Formula
  desc "Repository analysis for developers and AI coding agents"
  homepage "https://github.com/tool-bunker/code-buster"
  license "MIT"

  if OS.mac?
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.10.0/code-buster-macos-arm64.tar.gz"
    sha256 "444f47a4a57f8915a9c33117fe3ef392cf19c88fd0e2e08c2648bbd884d58928"
  else
    url "https://github.com/tool-bunker/code-buster/releases/download/v0.10.0/code-buster-linux-x64.tar.gz"
    sha256 "08e538aeb28c8c380b9a0153ef2a313ae19fea3ac3cd4dc7ce1fd50ddf0e43cb"
  end

  depends_on arch: :arm64 if OS.mac?
  depends_on arch: :x86_64 if OS.linux?

  def install
    bin.install "cb"
  end

  test do
    assert_match "cb 0.10.0", shell_output("#{bin}/cb version")
  end
end
