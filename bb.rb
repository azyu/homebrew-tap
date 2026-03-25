class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.3/bb_0.2.3_macos_arm64.tar.gz"
      sha256 "8f5a74360263185f9103957d536d90864a97dae1dcab075bcffc3269a74f3873"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.3/bb_0.2.3_linux_amd64.tar.gz"
      sha256 "7252a833a24cf1cb90429926d2265dce591d68a2b24e57f752bfe57df2241d1f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.3/bb_0.2.3_linux_arm64.tar.gz"
      sha256 "d0c9bea2f00fb748e2068b9c7d52fbea34a52990c71df32330ee9e3edbb474e4"
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
