class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.1/bb_0.1.1_macos_arm64.tar.gz"
      sha256 "a26a041487e37ea976ed635ef1a340710b4c09b656e09d45ec32c35a95f65159"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.1/bb_0.1.1_linux_amd64.tar.gz"
      sha256 "f03df555c20006d0049af2558a563f49e411acfffbceda04e9558f666a88e8a7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.1.1/bb_0.1.1_linux_arm64.tar.gz"
      sha256 "8b2e270dcde5bad98146e7715230d6c95c5ec81f4ae6dde9921b4b390e8897af"
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
