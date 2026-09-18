class Niksi < Formula
  desc "Skill manager for coding agents"
  homepage "https://github.com/osrim/niksi"
  version "0.3.2"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.2/niksi-darwin-arm64.tar.gz"
      sha256 "482d846ad74f87f3e53c141785e891463309dabf8ee7d4356a6ceb2a3cd89fcd"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.2/niksi-darwin-x64.tar.gz"
      sha256 "c67fb3a91e5df8065931ac04f51b6cca221043bc0723726845fe83a20afc98c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.2/niksi-linux-arm64.tar.gz"
      sha256 "166da31598626b66c7d6308adacd72ed4cf6cc86c0ae9e1f2747893db25eb24c"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.2/niksi-linux-x64.tar.gz"
      sha256 "27ec517c1635860058faaf811dcebb1555d60ce3fb7c0787352733f4cdb5d972"
    end
  end

  def install
    bin.install "nik"
  end

  def caveats
    <<~EOS
      ski was renamed to niksi. The command is now nik.
      Run any nik command in an existing project to migrate ski-lock.json and .ski.
      See https://github.com/osrim/niksi/releases/tag/v0.3.0
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nik --version")
  end
end
