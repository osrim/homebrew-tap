class Ski < Formula
  desc "Skill manager for coding agents"
  homepage "https://github.com/osrim/ski"
  version "0.2.0"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/ski/releases/download/v0.2.0/ski-darwin-arm64.tar.gz"
      sha256 "9c5b706280d3845c4b4d0d1a0fcc1ca7a3c8f9503bb19e1e7cbe81c4fd9f343f"
    else
      url "https://github.com/osrim/ski/releases/download/v0.2.0/ski-darwin-x64.tar.gz"
      sha256 "1920ad8553169c7a53db398bc737f6c66f75f24bc9d4c2ca1ae6690b499df706"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/ski/releases/download/v0.2.0/ski-linux-arm64.tar.gz"
      sha256 "e2dbee2dee7a48182abd3c5b5516d3237b839058e86b9f41532e7ad8f7214bb5"
    else
      url "https://github.com/osrim/ski/releases/download/v0.2.0/ski-linux-x64.tar.gz"
      sha256 "65c7188b09196aba6c93cdf4ace6572e370c0e0722d99ee3950290d025dd68f5"
    end
  end

  def install
    bin.install "ski"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ski --version")
  end
end
