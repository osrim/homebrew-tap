class Ski < Formula
  desc "Skill manager for coding agents"
  homepage "https://github.com/osrim/ski"
  version "0.2.2"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/ski/releases/download/v0.2.2/ski-darwin-arm64.tar.gz"
      sha256 "dec17545d48c701bccac0639b0130109f1da2168dc5103613e53c1bf0f607749"
    else
      url "https://github.com/osrim/ski/releases/download/v0.2.2/ski-darwin-x64.tar.gz"
      sha256 "7d60846e49b059435d7299b06ed5447a3908069a5a0b00ce1a91a353bb20d88c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/ski/releases/download/v0.2.2/ski-linux-arm64.tar.gz"
      sha256 "87e93dcc93142b04a6205e2791520b879904abb4e1ce0fc8b14053e972d1864e"
    else
      url "https://github.com/osrim/ski/releases/download/v0.2.2/ski-linux-x64.tar.gz"
      sha256 "bb14a49e9f668f2519dcc66bb9294b8cdf8898a5953e66f6117121c8d9143335"
    end
  end

  def install
    bin.install "ski"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ski --version")
  end
end
