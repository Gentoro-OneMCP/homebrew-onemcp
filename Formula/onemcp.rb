class Onemcp < Formula
  desc "CLI for Gentoro OneMCP - Connect APIs to AI models via Model Context Protocol"
  homepage "https://github.com/Gentoro-OneMCP/onemcp"
  license "Apache-2.0"
  version "0.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.5/onemcp-darwin-arm64.tar.gz"
      sha256 "d87bc312ad345d9493b959e5a1a41216150e16c6bb8065b1d05b60fae20e712a"
    else
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.5/onemcp-darwin-amd64.tar.gz"
      sha256 "f80bc795775fcfd948c9f1655645db71d3626e7968ef8e065bfc9f43bfd335a3"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.5/onemcp-linux-amd64.tar.gz"
      sha256 "b5c5da8eae96f9c3a79c4955d82ee5ac3e0c123b860f5f50c2d2d5b36a7d80b8"
    else
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.5/onemcp-linux-386.tar.gz"
      sha256 "8d62bd0221f09278f708966b223176ca79ce4bca3125c07eaae3cb41c363a167"
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
