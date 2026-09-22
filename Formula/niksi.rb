class Niksi < Formula
  desc "Install, review, and share agent skills"
  homepage "https://github.com/osrim/niksi"
  version "0.3.4"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.4/niksi-darwin-arm64.tar.gz"
      sha256 "1f0556fc9f41aa1a08bf0f1f25514ecfb05632c74cc3763fc6aa3e00a2fe01fb"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.4/niksi-darwin-x64.tar.gz"
      sha256 "831537d8c3a5defd9204a081a54a6157f3f80e469407dad62ee35bc5ddf7c706"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/niksi/releases/download/v0.3.4/niksi-linux-arm64.tar.gz"
      sha256 "ab9e0cf90d7603917c773f5af791adde9514b26f5664419a475b5cd3e1284914"
    else
      url "https://github.com/osrim/niksi/releases/download/v0.3.4/niksi-linux-x64.tar.gz"
      sha256 "5656cedc96dcfcd1da1c28af97cafda36d0011eb9db3e922fc5e50d8ca00299a"
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
