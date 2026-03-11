class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.3/bb_0.1.3_macos_arm64.tar.gz"
      sha256 "f468b2c443bb9da317fec933577e9b808cc5f1e5e22e362be093db7b449bdeac"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.3/bb_0.1.3_linux_amd64.tar.gz"
      sha256 "efbd8265f3aae8ebc011833b95e8ce0fe9bd0734156263fcbcd9c90db27b0467"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.3/bb_0.1.3_linux_arm64.tar.gz"
      sha256 "680a569c41f4ccce1ded809c877a8a169133a4cc0d8ec3d496e445a55f8e461c"
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
