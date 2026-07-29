class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.7/bb_0.2.7_macos_arm64.tar.gz"
      sha256 "50171ce745e2fdefc856a7ba8f81a924377c991822e1f9f3b2c8aa45dcd4e515"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.7/bb_0.2.7_linux_amd64.tar.gz"
      sha256 "7c0561d4827eb1f771a09b2e398873be8fc1685a7043bb46bc17a354a47c5c8b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.7/bb_0.2.7_linux_arm64.tar.gz"
      sha256 "35502131dbfaf6d1b53fb147e18a6b14acbe2759d82da01384517ee365dfe108"
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
