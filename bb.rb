class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.0/bb_0.1.0_macos_arm64.tar.gz"
      sha256 "e39ba278b5add3e5c91b2fb805de211e218a234a97af27d49b8232a31160f345"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.0/bb_0.1.0_linux_amd64.tar.gz"
      sha256 "df798bc1e18a259d3ed9225e8306162112c6ef2f084e6932a4f4b44ff95120fd"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.0/bb_0.1.0_linux_arm64.tar.gz"
      sha256 "bbd92ee026ecc4dbc9ac1301607de1a1cc33c88d56dc5bc50b1ebb4b8810e595"
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
