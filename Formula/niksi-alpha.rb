class NiksiAlpha < Formula
  desc "Install, review, and share agent skills (alpha channel)"
  homepage "https://github.com/osrim/niksi"
  version "0.5.0-alpha.4"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.4/niksi-darwin-arm64.tar.gz"
      sha256 "8654a8be1125624ae9b654caa659628c90d67ba46edc5fccb7f8688c52f0f2f6"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.4/niksi-darwin-x64.tar.gz"
      sha256 "f316bad717e290ee7e11e7ab6ba6bdbbf2c3e82a6d6292b5164b7068815cd17d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.4/niksi-linux-arm64.tar.gz"
      sha256 "0abfa91660ed34d8f1101c466ed69c5474b40ea22e9b6f7c088684ebfa056984"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.4/niksi-linux-x64.tar.gz"
      sha256 "a8ee294e255a816c2d5243fe33d19c7747ab640e3e91e5d9a101be969c65137f"
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
