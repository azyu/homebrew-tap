class Toss < Formula
  desc "Toss Securities Open API CLI"
  homepage "https://github.com/azyu/tossinvest-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/tossinvest-cli/releases/download/v0.1.2/toss_0.1.2_macos_arm64.tar.gz"
      sha256 "c316c19b04b1e47aa63289f12e73355999eab7e5135b0ab6dbcce1adf6701096"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/tossinvest-cli/releases/download/v0.1.2/toss_0.1.2_linux_amd64.tar.gz"
      sha256 "bd6b36fec17e29a32ae30c0fbda68dad9b6d0507d7181a948ac7fe5231357036"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/tossinvest-cli/releases/download/v0.1.2/toss_0.1.2_linux_arm64.tar.gz"
      sha256 "6527a674e71c4493b8e3ddc73346feee70aa9c87ae694f70f74505f554071b4c"
    end
  end

  def install
    bin.install "toss"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toss --version")
  end
end
