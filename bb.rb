class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb/releases/download/v0.0.3/bb_0.0.3_darwin_arm64.zip"
      sha256 "fc639262b415375df9c0c475091d4a24dc3226d4c02dc4b9691438f7708be900"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb/releases/download/v0.0.3/bb_0.0.3_linux_amd64.tar.gz"
      sha256 "8ef341fc17d162146831e7022a1a53dbd514d48cc5c951cbf7bf6beaf6cfa294"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb/releases/download/v0.0.3/bb_0.0.3_linux_arm64.tar.gz"
      sha256 "85d14a8ab84df8e5499246a3b5daa77be2bc5bcbbcdeb060b32fef7ced0c2312"
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
