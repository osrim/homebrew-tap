class Niksi < Formula
  desc "Install, review, and share agent skills"
  homepage "https://github.com/osrim/niksi"
  version "0.3.7"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.7/niksi-darwin-arm64.tar.gz"
      sha256 "2bac7104168108b95f54d91969c5e0a8597f8c367ad41a7bcc2e566ab8c74f01"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.7/niksi-darwin-x64.tar.gz"
      sha256 "9b76b69a8641059e59abb418ba021d25ac152e8632d62d3857e2833ba1f1ce62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.7/niksi-linux-arm64.tar.gz"
      sha256 "2603c56f84e1d3739ed307e624ada80c79b8cc5e1a51499dce1f1b33dd9843bd"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.7/niksi-linux-x64.tar.gz"
      sha256 "41eaca1f5e2fa6ccbf64585ff2f4105ea05cef8afd527306cc03ee9de5dae529"
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
