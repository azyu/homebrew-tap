class Bb < Formula
  desc "Bitbucket Cloud CLI inspired by gh"
  homepage "https://github.com/azyu/bb"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azyu/bb/releases/download/v0.0.1/bb_0.0.1_darwin_arm64.zip"
      sha256 "c901c78395ef5b2d338d081fdc3e3c48f7cdfddc39b5039d7ff6004f5e6f5934"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/azyu/bb/releases/download/v0.0.1/bb_0.0.1_linux_amd64.tar.gz"
      sha256 "f9d8d2ccd14f947c8ef65410423431b49eccb4b6d1e2ef0a0d804346a6fac0c8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/azyu/bb/releases/download/v0.0.1/bb_0.0.1_linux_arm64.tar.gz"
      sha256 "f959b3a18d78da232a23eeae7deeab01c7ef921dbb958376389db9df41134aac"
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
