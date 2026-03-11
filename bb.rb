class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.2/bb_0.1.2_macos_arm64.tar.gz"
      sha256 "c1cb4acf0650f26d33635d19cce5a01f813918e934ba7f32939a6195c2729334"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.2/bb_0.1.2_linux_amd64.tar.gz"
      sha256 "70061e8d13eb4960c191cc3b108bb5c12aa6e04710362eba4ea4da332885d787"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.2/bb_0.1.2_linux_arm64.tar.gz"
      sha256 "4558b426acb1b109e1daa65d4e2cbd7321d98b66cc7a24c8b9cd25bc255441bc"
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
