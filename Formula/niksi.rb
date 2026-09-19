class Niksi < Formula
  desc "Install, review, and share agent skills"
  homepage "https://github.com/osrim/niksi"
  version "0.3.3"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.3/niksi-darwin-arm64.tar.gz"
      sha256 "c3c3f7c11c8c841b0834e362e6faab063dbdf60bb1bc5cee8a50dfe3de2fcb27"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.3/niksi-darwin-x64.tar.gz"
      sha256 "f0205f464e6b7c5fc7dedcf00c64d728d90292e33eeed31dc0c2f35b002fdb5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.3/niksi-linux-arm64.tar.gz"
      sha256 "1c330c54d3e1d78fb1021d4678076231fec09030645aaa68fd3b87d8508a3e6f"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.3/niksi-linux-x64.tar.gz"
      sha256 "4feea420bf964561eb3ae19bf9fbe3d47c7217a06c59a4e9d351ef2eefcdccdd"
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
