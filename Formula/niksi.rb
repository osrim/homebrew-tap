class Niksi < Formula
  desc "Install, review, and share agent skills"
  homepage "https://github.com/osrim/niksi"
  version "0.4.2"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.4.2/niksi-darwin-arm64.tar.gz"
      sha256 "1631df097070dbe5e6435cb7e99840511fa418191f785215aa3d79f4da933027"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.4.2/niksi-darwin-x64.tar.gz"
      sha256 "7f91a0100ba68dc4a37291a92a6133cdafdcaeee68f7a10cb7017294f7321cea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.4.2/niksi-linux-arm64.tar.gz"
      sha256 "210045087e7fd2cdd82c28a3538300b2791818dd0c2032274e9efeef2dffd2c7"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.4.2/niksi-linux-x64.tar.gz"
      sha256 "740a1c82fe1d6daa7405834bff94eb13d2eb5d0b62b549d6de96d02a73f3a8bb"
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
