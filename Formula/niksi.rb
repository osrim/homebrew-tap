class Niksi < Formula
  desc "Skill manager for coding agents"
  homepage "https://github.com/osrim/niksi"
  version "0.3.0"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.0/niksi-darwin-arm64.tar.gz"
      sha256 "bcdc053d46d483a5499564dcd759d68aa274cc48822e16d389374194e823f4b7"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.0/niksi-darwin-x64.tar.gz"
      sha256 "2400fd7c7345051567c4501f2c0306c4f1d46b3b54e28521574b48abb159a1f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.0/niksi-linux-arm64.tar.gz"
      sha256 "0af378ea6ea6785f48f724a81e7e7c7cee6d71c91206ef271cf330cc92af2427"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.0/niksi-linux-x64.tar.gz"
      sha256 "e6d8ccb9e26596821927b6812b408eb832c5113c5557725fef9b125053d3c379"
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
