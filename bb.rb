class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb/releases/download/v0.0.2/bb_0.0.2_darwin_arm64.zip"
      sha256 "53baf2fe474c6e79fdf4f16bd229ecbc7dbcdebdbf195098ae9d054feaf81615"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb/releases/download/v0.0.2/bb_0.0.2_linux_amd64.tar.gz"
      sha256 "85d0db0c989866b35fe0eda8440890a4194a39e6ab46894cde6904dc154f2ac5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb/releases/download/v0.0.2/bb_0.0.2_linux_arm64.tar.gz"
      sha256 "4a9f587f4c981b0e13ee4af05691d63c2936ae3cd42a420e2c9fd03b01b007ef"
    end
  end

  def install
    bin.install "bb"
    generate_completions_from_executable(bin/"bb", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bb version")
  end
end
