class Niksi < Formula
  desc "Install, review, and share agent skills"
  homepage "https://github.com/osrim/niksi"
  version "0.5.0"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.5.0/niksi-darwin-arm64.tar.gz"
      sha256 "c1ec6eacae307291cd11c77a10f9d1e5ec50d355247d5d5f14539080aa8ffc8e"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.5.0/niksi-darwin-x64.tar.gz"
      sha256 "d4e2209f1822180a0f9d8c469b4471472010185a22ea7167a1d35db08265b89f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.5.0/niksi-linux-arm64.tar.gz"
      sha256 "1845eb133ea29939b1ed864029916447f5e49e987367f576f0e83a3a9bc9fdec"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.5.0/niksi-linux-x64.tar.gz"
      sha256 "e9af52d00d12eae3f56a10c68c92d13be2276ac3d056f1b809035f5d6bcefc7d"
    end
  end

  conflicts_with "osrim/tap/niksi-alpha", because: "both install the nik command"

  def install
    bin.install "nik"
    generate_completions_from_executable(bin/"nik", "completion")
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
