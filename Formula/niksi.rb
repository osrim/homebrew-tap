class Niksi < Formula
  desc "Install, review, and share agent skills"
  homepage "https://github.com/osrim/niksi"
  version "0.3.5"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.5/niksi-darwin-arm64.tar.gz"
      sha256 "b35b036be2c8e768903c4091915a90d3267485157c5f2222ac7f8106f9671bdc"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.5/niksi-darwin-x64.tar.gz"
      sha256 "b594e7b9dd837f190074bc5c944652650d2b5a207f097e2a85f87c372ce5969e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.5/niksi-linux-arm64.tar.gz"
      sha256 "bf80599655346cacb77e7f49e99f727528a27d542bdf072107ece2d23294da53"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.5/niksi-linux-x64.tar.gz"
      sha256 "90b27fa1cfff44333d7fa6c4e3cf2a45e2fb9ce89076fd6a78a0fa425b71f16d"
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
