class Toss < Formula
  desc "Toss Securities Open API CLI"
  homepage "https://github.com/azyu/tossinvest-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/tossinvest-cli/releases/download/v0.1.3/toss_0.1.3_macos_arm64.tar.gz"
      sha256 "d1973a9804fa1d776e130e196b2ea9c6cfb4e76e4edffa71fa619be5be172009"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/tossinvest-cli/releases/download/v0.1.3/toss_0.1.3_linux_amd64.tar.gz"
      sha256 "48b1f747f77183f367b8e45c944ec31d1f328626cfdab4ff57f56c9b43ee6f8e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/tossinvest-cli/releases/download/v0.1.3/toss_0.1.3_linux_arm64.tar.gz"
      sha256 "c019653fc4332e829f57bd41a25e699520f45b9ef1b4827be025e59e132d6350"
    end
  end

  def install
    bin.install "toss"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toss --version")
  end
end
