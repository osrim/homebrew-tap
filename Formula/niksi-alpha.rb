class NiksiAlpha < Formula
  desc "Install, review, and share agent skills (alpha channel)"
  homepage "https://github.com/osrim/niksi"
  version "0.5.0-alpha.2"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.2/niksi-darwin-arm64.tar.gz"
      sha256 "156ef9313871e15195358b6bfe48dcbd27d5aa7ef7725e1c8714699a85f4a028"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.2/niksi-darwin-x64.tar.gz"
      sha256 "ecdc7e9c0b9c1b085c7b76a78d3c7a5c1ca7c1743aaeffd634290eff20bbf4f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.2/niksi-linux-arm64.tar.gz"
      sha256 "fcf39c2c3b430c81ae34330dc17e8ee103015f4113364781b1ebe94680cf2599"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.2/niksi-linux-x64.tar.gz"
      sha256 "260becc023a10e8477c254aaa71a08f25f4a524dc4eca5a252d95bf096b82d64"
    end
  end

  conflicts_with "osrim/tap/niksi", because: "both install the nik command"

  def install
    bin.install "nik"
    generate_completions_from_executable(bin/"nik", "completion")
  end

  def caveats
    <<~EOS
      niksi-alpha follows every niksi release, alphas included.
      To go back to stable releases:
        brew uninstall niksi-alpha && brew install osrim/tap/niksi
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nik --version")
  end
end
