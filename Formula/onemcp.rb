class Onemcp < Formula
  desc "CLI for Gentoro OneMCP - Connect APIs to AI models via Model Context Protocol"
  homepage "https://github.com/Gentoro-OneMCP/onemcp"
  license "Apache-2.0"
  version "0.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.4/onemcp-darwin-arm64.tar.gz"
      sha256 "67cc447e5a5c55b35d1fafa972b71f28fbddf2d3b09451d534e7f617dce13aa1"
    else
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.4/onemcp-darwin-amd64.tar.gz"
      sha256 "e7c87fc9c1855c94d68297df87a744c776e3bd41189e666052cbb2aa1dac7bc1"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.4/onemcp-linux-amd64.tar.gz"
      sha256 "6e2ce6a6b1bea2954dd473824c7b14879a45ff21c4751e6e15bf9fec3eaba0a5"
    else
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.4/onemcp-linux-386.tar.gz"
      sha256 "77920a6e8092740c0509b19114743e33c93b20344d4a5e1ec7ebab2bca331511"
    end
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
