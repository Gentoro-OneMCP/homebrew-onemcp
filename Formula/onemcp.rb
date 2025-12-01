class Onemcp < Formula
  desc "CLI for Gentoro OneMCP - Connect APIs to AI models via Model Context Protocol"
  homepage "https://github.com/Gentoro-OneMCP/onemcp"
  license "Apache-2.0"
  version "0.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.1/onemcp-darwin-arm64.tar.gz"
      sha256 "ccb57a11a8e21adb2d84de6a4ba44940d296db9727ef791ac9044be3738f08ce"
    else
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.1/onemcp-darwin-amd64.tar.gz"
      sha256 "7d90baf377d42fbfddf8c85e039ba6f6e10f368274e5f6a069a4f5c3c8528835"
    end
  end

  on_linux do
    url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.1/onemcp-linux-amd64.tar.gz"
    sha256 "18a4e8042f3392665a0d3cc2cbe0f1a7e9255355cc46bd64cef1b3cc8c11aaa1"
  end

  depends_on "docker" => :recommended

  def install
    bin.install "onemcp"
  end

  def caveats
    <<~EOS
      OneMCP requires Docker to run the server.
      
      Get started:
        onemcp chat
      
      View all commands:
        onemcp --help
    EOS
  end

  test do
    assert_match "Gentoro One MCP CLI", shell_output("#{bin}/onemcp --help")
  end
end
