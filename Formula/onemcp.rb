class Onemcp < Formula
  desc "CLI for Gentoro OneMCP - Connect APIs to AI models via Model Context Protocol"
  homepage "https://github.com/Gentoro-OneMCP/onemcp"
  license "Apache-2.0"
  version "0.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.4/onemcp-darwin-arm64.tar.gz"
      sha256 "52f0d0879d09d1d7de7285d3b6f829316c2dc6736484a2ccb796bd14b7815921"
    else
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.4/onemcp-darwin-amd64.tar.gz"
      sha256 "48777eef34f35e9b9a11aad4e2710c0fbdf3d87fd0a0cce3ba9cb56b7e683db8"
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.4/onemcp-linux-amd64.tar.gz"
      sha256 "2368e90ac2b50130a63aa16b22ff7f402267b0d41fd5770c974670f60ae16a01"
    else
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.4/onemcp-linux-386.tar.gz"
      sha256 "d9d3f3cf9fb89d483020e2f5eea5c8e850e4b67ba35742262e315706798232a5"
    end
  end

  on_windows do
    if Hardware::CPU.is_64_bit?
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.4/onemcp-windows-amd64.zip"
      sha256 "b0c18ebe41658ad7a08f3b8bbba8e18872ecf19d306f1b849b50779c993eca80"
    else
      url "https://github.com/Gentoro-OneMCP/onemcp/releases/download/cli-v0.0.4/onemcp-windows-386.zip"
      sha256 "9e3aabe58d1bc046228cb48fd03f310f5d44507c401ce02881c92bb5ce32a7b1"
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
