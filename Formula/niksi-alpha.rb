class NiksiAlpha < Formula
  desc "Install, review, and share agent skills (alpha channel)"
  homepage "https://github.com/osrim/niksi"
  version "0.5.0-alpha.3"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.3/niksi-darwin-arm64.tar.gz"
      sha256 "c18ca5f3ffcd4d255dc1f05fa633d0a0a12b6b29a8958055906ceab66a28c060"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.3/niksi-darwin-x64.tar.gz"
      sha256 "605d8a80af7009ce19d8136670d00a2b79b37917dd6956a85b0a050ccd830326"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.3/niksi-linux-arm64.tar.gz"
      sha256 "b676af038f34c73857b7dcb3c1b031a435b43d62be048516d2776d0e4ccf7794"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.3/niksi-linux-x64.tar.gz"
      sha256 "8fc02352e9054ba0ebe3f569936fe00b541b0664f225d6e55466abd3c4db4f79"
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
