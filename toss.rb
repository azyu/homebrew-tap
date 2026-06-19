class Toss < Formula
  desc "Toss Securities Open API CLI"
  homepage "https://github.com/azyu/tossinvest-cli"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/tossinvest-cli/releases/download/v0.0.1/toss_0.0.1_macos_arm64.tar.gz"
      sha256 "1786e9ce664f3384b03574c218b7b66e258ac4e4d25224ebae6811d4b7236575"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/tossinvest-cli/releases/download/v0.0.1/toss_0.0.1_linux_amd64.tar.gz"
      sha256 "79ca8a2f2ea7a21b8010fbbce6247942662d9484c1d436204096851a7255d64e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/tossinvest-cli/releases/download/v0.0.1/toss_0.0.1_linux_arm64.tar.gz"
      sha256 "ca0603f9ef3b2e3298062d63f3726eda945db616eecd89c8ab068b2e25f85d66"
    end
  end

  def install
    bin.install "toss"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toss --version")
  end
end
