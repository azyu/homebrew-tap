class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.8/bb_0.2.8_macos_arm64.tar.gz"
      sha256 "a1f812344b1d4e8f0a0464d0fb6521430c8ae9e4992e4f21f5576c440c341674"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.8/bb_0.2.8_linux_amd64.tar.gz"
      sha256 "cdff99df5eacf8cbba6574c4aac6e3a53e7507a1e3ae30556c3e98ddb264b383"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.8/bb_0.2.8_linux_arm64.tar.gz"
      sha256 "4337e29a7a4a1ced167e93566bc6373efd0a1efd2096fa836b71d723055b71da"
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
