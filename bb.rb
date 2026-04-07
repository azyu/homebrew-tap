class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.4/bb_0.2.4_macos_arm64.tar.gz"
      sha256 "bc3673e5647fb5d2cf56b94839f6645ccbf8b06e2c387c2373bfcc18ad3bf505"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.4/bb_0.2.4_linux_amd64.tar.gz"
      sha256 "133a7213054f93a95e9a28bc477a1d672f84e2908723811a997f079e9b88f82f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.4/bb_0.2.4_linux_arm64.tar.gz"
      sha256 "2b866d6f4b391b9691278f3980d15c564a8f8322575fc2c7106597ef07e3b1df"
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
