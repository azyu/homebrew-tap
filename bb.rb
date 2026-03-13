class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.4/bb_0.1.4_macos_arm64.tar.gz"
      sha256 "4b54b2582077bc68fd49baa931bbd3293c6dc0fac4d7eb14b552a756dc2c8268"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.4/bb_0.1.4_linux_amd64.tar.gz"
      sha256 "1be355e084fa851494fca33a402c4f871f72b3169ccda85d3ab81710f12090c2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.4/bb_0.1.4_linux_arm64.tar.gz"
      sha256 "10a0961c570b021ca9b012dabb5f69b03993821421b8431f742711ea58c91835"
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
