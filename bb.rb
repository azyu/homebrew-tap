class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.0/bb_0.2.0_macos_arm64.tar.gz"
      sha256 "6f2743d94501065988362a2af92e488e56ffc83a112b52af021a783779b9be58"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.0/bb_0.2.0_linux_amd64.tar.gz"
      sha256 "8e2487c7f017b7795a424361dc03da2cdb13583688f8117098bb53a0f256cc89"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.0/bb_0.2.0_linux_arm64.tar.gz"
      sha256 "3f4c1f26c9b9b6764b176950c36140919dfb371ba6b8dbd06a1f064664763914"
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
