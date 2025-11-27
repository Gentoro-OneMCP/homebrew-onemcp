class Onemcp < Formula
  desc "CLI for Gentoro OneMCP - Connect APIs to AI models via Model Context Protocol"
  homepage "https://github.com/Gentoro-OneMCP/onemcp"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/v0.1.0/onemcp-darwin-arm64.tar.gz"
      sha256 "517f59e2a16b9d88b29becc6b8913bc81731396e7eb85075118d09d2169a2636"
    else
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/v0.1.0/onemcp-darwin-amd64.tar.gz"
      sha256 "74ca792a5f03a1381209f5d70b68ee6c24c94a7d5f18c48bb8fc75d15d20363c"
    end
  end

  on_linux do
    url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/v0.1.0/onemcp-linux-amd64.tar.gz"
    sha256 "47f9116e0732217fce2f27c940a17fa83611c0d5e1ed2cf56966452e48d08082"
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
