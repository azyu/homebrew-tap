class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.1/bb_0.2.1_macos_arm64.tar.gz"
      sha256 "f957452477bcb73fff0c71594bc62bad14a64bf00e6fae74279c3bdfeb824d05"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.1/bb_0.2.1_linux_amd64.tar.gz"
      sha256 "b0dee730ffbdb4ad27654a40aed0b33f12201dcaf341398501afa88e0f25642e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.1/bb_0.2.1_linux_arm64.tar.gz"
      sha256 "c976b959f964551c8a1a94b4444005bdbc8b8003275e8a8a93c952d7940192d7"
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
