class Kis < Formula
  desc "KIS Open API CLI for Korea Investment & Securities"
  homepage "https://github.com/azyu/kis-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/kis-cli/releases/download/v0.1.2/kis_0.1.2_macos_arm64.tar.gz"
      sha256 "c84bdbef91d87712e464f500c6d36787df30830d2123682885a6957137471270"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/kis-cli/releases/download/v0.1.2/kis_0.1.2_linux_amd64.tar.gz"
      sha256 "efbdd3737a6b11976785fad6778c83a01b13e76318e76847fede361e4d914f84"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/kis-cli/releases/download/v0.1.2/kis_0.1.2_linux_arm64.tar.gz"
      sha256 "3608f742e1acf9d1b9b204377f4f34ca3cd7ddb279d1ad53b3114c217314bf81"
    end
  end

  def install
    bin.install "kis"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/kis --help")
  end
end
