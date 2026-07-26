class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.6/bb_0.2.6_macos_arm64.tar.gz"
      sha256 "91d9f0891608437c2f36bcf76f7cb0ae12769e0f6b19fef74810c00d381095e5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.6/bb_0.2.6_linux_amd64.tar.gz"
      sha256 "7436f968699ec8eb92b3475d39910c51e984db00e110025063d121cd53cb2996"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.6/bb_0.2.6_linux_arm64.tar.gz"
      sha256 "9bb1d2f2598135e86fee9a07bc1a318686a2b65fe01493fb98b7f1a2077ac8d5"
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
