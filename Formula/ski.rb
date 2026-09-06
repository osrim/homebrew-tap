class Ski < Formula
  desc "Skill manager for coding agents"
  homepage "https://github.com/osrim/ski"
  if Hardware::CPU.arm?
    url "https://github.com/osrim/ski/releases/download/v0.1.0/ski-darwin-arm64.tar.gz"
    sha256 "b247760d432be0d72da816aaaeba8e336b68972d5d7cabecc518349bfb7c52c4"
  else
    url "https://github.com/osrim/ski/releases/download/v0.1.0/ski-darwin-x64.tar.gz"
    sha256 "295ea41dd0685c64482000777d6bf385b1a2d93c4a1e11cdd295d7b3d5867da5"
  end
  version "0.1.0"
  license "MIT"

  depends_on "git"
  depends_on :macos

  def install
    bin.install "ski"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ski --version")
  end
end
