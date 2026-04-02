class Kis < Formula
  desc "KIS Open API CLI for Korea Investment & Securities"
  homepage "https://github.com/azyu/kis-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/kis-cli/releases/download/v0.1.1/kis_0.1.1_macos_arm64.tar.gz"
      sha256 "ab8b32847560174c20a31736dc11f7422b68e1b092ab0cbf5d85bd4427a1c415"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/kis-cli/releases/download/v0.1.1/kis_0.1.1_linux_amd64.tar.gz"
      sha256 "c0f89837f89ad988089d6dbe2a08a1ff3437c9b612979fea42335ec048b5c15e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/kis-cli/releases/download/v0.1.1/kis_0.1.1_linux_arm64.tar.gz"
      sha256 "53bce6f0262cb6a074c17166736fa7222d45b004638abaf00e9dcb37680d5383"
    end
  end

  def install
    bin.install "kis"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/kis --help")
  end
end
