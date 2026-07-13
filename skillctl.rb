class Skillctl < Formula
  desc "Agent Skills materialization CLI"
  homepage "https://github.com/azyu/skillctl"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/skillctl/releases/download/v0.1.1/skillctl_0.1.1_macos_arm64.tar.gz"
      sha256 "785062b69b9f70bbf2c16a5d8ed09f082e9c0f10c74deff01e9cda7f7ae25389"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/skillctl/releases/download/v0.1.1/skillctl_0.1.1_linux_amd64.tar.gz"
      sha256 "b62f6ce71a9793a4f11ec0efd7471ebd30243b10765372b4cb009f3156637b00"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/skillctl/releases/download/v0.1.1/skillctl_0.1.1_linux_arm64.tar.gz"
      sha256 "3cae09ffc5f62c93541e7cea7c1913045912105831909277f81fed9ac9a7590d"
    end
  end

  def install
    bin.install "skillctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skillctl version")
  end
end
