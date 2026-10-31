class NiksiAlpha < Formula
  desc "Install, review, and share agent skills (alpha channel)"
  homepage "https://github.com/osrim/niksi"
  version "0.5.0-alpha.1"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.1/niksi-darwin-arm64.tar.gz"
      sha256 "30f1e242eda73abe751a3c7c07f05b7454ba0aaa793da8d1d170fe072a9059f8"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.1/niksi-darwin-x64.tar.gz"
      sha256 "6ba8944728c7340ec4be646b9a0f771c6dfeb1904d94aa9bda02462b9f47bb31"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.1/niksi-linux-arm64.tar.gz"
      sha256 "d3e15a5616d3587ab7925f3cc56eb9954af551fb207e6ba168d6cd28f714f1c6"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.5.0-alpha.1/niksi-linux-x64.tar.gz"
      sha256 "ba27ba185cbe99b4f0aa0971ee5b2fbd63e1c3a138379fa9ecad8cdf6828cc22"
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
