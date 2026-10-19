class Niksi < Formula
  desc "Install, review, and share agent skills"
  homepage "https://github.com/osrim/niksi"
  version "0.3.6"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.6/niksi-darwin-arm64.tar.gz"
      sha256 "35263ebd4638d418f1ab560f2951c56c4123b59148afe38494440785120ce5bf"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.6/niksi-darwin-x64.tar.gz"
      sha256 "f1ef3f1dbe06aed234a9b77c73864231eb5e5531981447ac0e0c3eeacf807d78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.6/niksi-linux-arm64.tar.gz"
      sha256 "7c4b0cbd5bb73c7be93a3e5588c8652cb0a4bd044c0f570201ad80d4886aee34"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.6/niksi-linux-x64.tar.gz"
      sha256 "a062a19c881e1ffef4703097d0efd8a1ce4f4b2310c669679c6fa0b9896cae2c"
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
