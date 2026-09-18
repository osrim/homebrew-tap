class Niksi < Formula
  desc "Skill manager for coding agents"
  homepage "https://github.com/osrim/niksi"
  version "0.3.1"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.1/niksi-darwin-arm64.tar.gz"
      sha256 "a98acf9cea793aa4b4a5be011923ca572f0c20218a32591580850d7d9933d323"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.1/niksi-darwin-x64.tar.gz"
      sha256 "10737dbcb23f9b7b5d4d460cc99ab49dde9769ad543843fc13df998e90045e36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.1/niksi-linux-arm64.tar.gz"
      sha256 "226462d0f69eadd7ec8020800048a335bba4e8935f03a527e3a19e46194e8879"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.1/niksi-linux-x64.tar.gz"
      sha256 "991fcc4392d01adc3191d55a8de942db66e767036235b93e023a2f208c1bbe4a"
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
