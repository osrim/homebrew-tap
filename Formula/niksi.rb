class Niksi < Formula
  desc "Install, review, and share agent skills"
  homepage "https://github.com/osrim/niksi"
  version "0.4.1"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.4.1/niksi-darwin-arm64.tar.gz"
      sha256 "0bd1aa6331f11d26689ecc4811d0f03252e197351e8e6ad1c13ff36e5b4c7142"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.4.1/niksi-darwin-x64.tar.gz"
      sha256 "5989ba2e5c0d9da3af9d95e2fd040988c8cb5cea843102d6a25636b26ec6b553"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.4.1/niksi-linux-arm64.tar.gz"
      sha256 "e2de4197acdb6ab5197dd9ffca6d13eba4483e7f19d948977a580ad0a7cdc112"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.4.1/niksi-linux-x64.tar.gz"
      sha256 "06c64acf2e801272597f23cbe2281397a0d8be6a5a066ad0688e9e68acc679b7"
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
