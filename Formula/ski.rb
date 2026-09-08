class Ski < Formula
  desc "Skill manager for coding agents"
  homepage "https://github.com/osrim/ski"
  version "0.2.1"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/ski/releases/download/v0.2.1/ski-darwin-arm64.tar.gz"
      sha256 "98b12d193e79f5ab1d6d11e421a18e400da11f1dd030ad06a930101c3bcb8591"
    else
      url "https://github.com/osrim/ski/releases/download/v0.2.1/ski-darwin-x64.tar.gz"
      sha256 "e6f573ad45002514ec4e35eb58de1aa08dce58e72beb0a18bffe4b4fcda86dcf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/ski/releases/download/v0.2.1/ski-linux-arm64.tar.gz"
      sha256 "86af664d10b1f3d0b1ddf0bc9613678f965d37e1b428ee621b807e195f5752ff"
    else
      url "https://github.com/osrim/ski/releases/download/v0.2.1/ski-linux-x64.tar.gz"
      sha256 "27de60320efbb6db76ed4893943d3b05220421869d4dfc2123d24c889cd953dd"
    end
  end

  def install
    bin.install "ski"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ski --version")
  end
end
