class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.2/bb_0.2.2_macos_arm64.tar.gz"
      sha256 "95f6a74252a8aefbf9ac364bd4bc7ca6a9f7bb3fc5c36882f8406c607045ffe7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.2/bb_0.2.2_linux_amd64.tar.gz"
      sha256 "6ed6ca2fd4e2d5f8b9b56c0670f5884a5b41cf533a0e6131e4ff67ebc610de48"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.2/bb_0.2.2_linux_arm64.tar.gz"
      sha256 "a9abd920147bd7d3c0bef9588348b4a80ecceed5ea5b10339747245b10fb3dfc"
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
