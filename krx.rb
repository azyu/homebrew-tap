class Krx < Formula
  desc "Agent-friendly KRX Open API CLI"
  homepage "https://github.com/azyu/krx-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/krx-cli/releases/download/v0.1.1/krx_0.1.1_darwin_arm64.tar.gz"
      sha256 "23d55e82f2c1c3ab81e3807127c05a7a45a74974b4e8477efd732b49b5fee98b"
    else
      odie "krx Homebrew binaries are only published for macOS arm64."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/krx-cli/releases/download/v0.1.1/krx_0.1.1_linux_amd64.tar.gz"
      sha256 "5fdf5aa34fa9371b91ac95466fca0136a505c39a2018629673e678e4860e85b4"
    elsif Hardware::CPU.arm?
      url "https://github.com/azyu/krx-cli/releases/download/v0.1.1/krx_0.1.1_linux_arm64.tar.gz"
      sha256 "10400bff1a86f63c664893bbeef1847920affe91d13bed0fdfc4ef3743acf903"
    else
      odie "krx Homebrew binaries are only published for Linux amd64 and arm64."
    end
  end

  def install
    bin.install "krx"
    prefix.install_metafiles
  end

  test do
    assert_match "Agent-friendly KRX Open API CLI", shell_output("#{bin}/krx --help")
    assert_match "Usage: krx mcp", shell_output("#{bin}/krx mcp --help")
  end
end
