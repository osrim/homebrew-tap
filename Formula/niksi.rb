class Niksi < Formula
  desc "Install, review, and share agent skills"
  homepage "https://github.com/osrim/niksi"
  version "0.4.0"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.4.0/niksi-darwin-arm64.tar.gz"
      sha256 "e7980e68125d34040a7bca59cf1cbef8d89033a2402f07f599ecf361a8687769"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.4.0/niksi-darwin-x64.tar.gz"
      sha256 "44ea27a7beee72f575a5a549bb99bfbb06f5956e904808dbfe393bf9b154ceaa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.4.0/niksi-linux-arm64.tar.gz"
      sha256 "2572c8f581d9258d5eca256bc394751ca4fcc922ce934eec57d6e28ceeabb1fe"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.4.0/niksi-linux-x64.tar.gz"
      sha256 "6250033fa28ef73355c8669322d751dbdc839498e3f9a3b8c9ddba5d8e5f4c7a"
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
