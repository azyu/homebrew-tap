class Krx < Formula
  desc "Agent-friendly KRX Open API CLI"
  homepage "https://github.com/azyu/krx-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/krx-cli/releases/download/v0.1.0/krx_0.1.0_darwin_arm64.tar.gz"
      sha256 "fbb1b57db6523d743ffac45a98efc94b47379f2611b9e047055c95ab1704ceb6"
    else
      odie "krx Homebrew binaries are only published for macOS arm64."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/krx-cli/releases/download/v0.1.0/krx_0.1.0_linux_amd64.tar.gz"
      sha256 "c2cefd4e82461d79aa8186962edea9f86e2eab93f92a91b10c9646e4f665adcc"
    elsif Hardware::CPU.arm?
      url "https://github.com/azyu/krx-cli/releases/download/v0.1.0/krx_0.1.0_linux_arm64.tar.gz"
      sha256 "436d06dd908ca97897a56c083e4997b1a73cc4591bdc5c01272d00839900e051"
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
  end
end
