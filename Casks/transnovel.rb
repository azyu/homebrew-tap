cask "transnovel" do
  version "0.1.5"
  sha256 "beb30c30f445166477d4a4af0d2611c01dc9ed9fc567e3e4fd27fa01879c0374"

  url "https://github.com/azyu/transnovel/releases/download/v#{version}/TransNovel_#{version}_aarch64.dmg"
  name "TransNovel"
  desc "AI-powered Japanese web novel translator"
  homepage "https://github.com/azyu/transnovel"

  auto_updates true
  depends_on arch: :arm64

  app "TransNovel.app"
end
