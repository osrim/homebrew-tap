class Niksi < Formula
  desc "Install, review, and share agent skills"
  homepage "https://github.com/osrim/niksi"
  version "0.4.1"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.4.1/niksi-darwin-arm64.tar.gz"
      sha256 "f102fe9683248ecb70a9a5e467900ef27d231696cebbb9372996dd36736fc115"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.4.1/niksi-darwin-x64.tar.gz"
      sha256 "25705dd8ac61e31bf0cb0a764dfdefd4824e40c2ab5b766530f55a5c9a1de6ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.4.1/niksi-linux-arm64.tar.gz"
      sha256 "178e4b797eb83e736d530824c5a5721e453633a016d4d8e5d5c02570baa7e2ea"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.4.1/niksi-linux-x64.tar.gz"
      sha256 "cfac1b7aa50d4a7552dc10ae376e749729d994b8d94589d61d9107116509ff55"
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
