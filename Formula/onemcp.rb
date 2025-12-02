class Onemcp < Formula
  desc "CLI for Gentoro OneMCP - Connect APIs to AI models via Model Context Protocol"
  homepage "https://github.com/Gentoro-OneMCP/onemcp"
  license "Apache-2.0"
  version "0.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.2/onemcp-darwin-arm64.tar.gz"
      sha256 "10bd78a952aa17db9a37bdf40483d5138579f8936b18cd37699f4fe5ed9831f4"
    else
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.2/onemcp-darwin-amd64.tar.gz"
      sha256 "9a35215cc99bc7ee405ecc6e18894fd55018cbbfb043ebf09e9c998d1b9a22c2"
    end
  end

  on_linux do
    url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.2/onemcp-linux-amd64.tar.gz"
    sha256 "eb7c4538717bdbeee174c390ff918f30b31994caa6aa30f5226f9c9a8c796a4d"
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
