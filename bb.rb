class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb-cli"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.5/bb_0.2.5_macos_arm64.tar.gz"
      sha256 "505e96b798c6c4b92f563a216470fb69d3207f890c5b25e875d3698206ced76d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.5/bb_0.2.5_linux_amd64.tar.gz"
      sha256 "0f21d749fb8dea9625211611f82ed577f9519cfa07a915fee4b7e921a8c40715"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb-cli/releases/download/v0.2.5/bb_0.2.5_linux_arm64.tar.gz"
      sha256 "f8b48664a1781c0876d38845bf2b11eb42661bc3d23baa951b59bac544933d39"
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
