class Onemcp < Formula
  desc "CLI for Gentoro OneMCP - Connect APIs to AI models via Model Context Protocol"
  homepage "https://github.com/Gentoro-OneMCP/onemcp"
  license "Apache-2.0"
  version "0.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.3/onemcp-darwin-arm64.tar.gz"
      sha256 "bd577241e37c72e51f32fde7788e2e39b20f5998e92fd1f733a418f9f504a140"
    else
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.3/onemcp-darwin-amd64.tar.gz"
      sha256 "6d10813bd23e7a3831a05f880670da683a577bd5b7a202b2713c0d27e041fe9d"
    end
  end

  on_linux do
    url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.3/onemcp-linux-amd64.tar.gz"
    sha256 "e0659a98872c83184389c319de957c2252474612d994b1f0cddd867a7a5ba07a"
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
