class Skillctl < Formula
  desc "Agent Skills materialization CLI"
  homepage "https://github.com/azyu/skillctl"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/skillctl/releases/download/v0.1.0/skillctl_0.1.0_macos_arm64.tar.gz"
      sha256 "0aff2d818a11c6fb1b8d03acff028c3e37b033190529354ac02d2b705e0f7354"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/skillctl/releases/download/v0.1.0/skillctl_0.1.0_linux_amd64.tar.gz"
      sha256 "1582645bb12b82a5eef98713149b52b3fe2357c056892edf6698d5627b631dcb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/skillctl/releases/download/v0.1.0/skillctl_0.1.0_linux_arm64.tar.gz"
      sha256 "eee5728a1339e0ad6d348853a4ea4726ad1e863ce161a6313c70dc8d24c7da5e"
    end
  end

  def install
    bin.install "skillctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skillctl version")
  end
end
