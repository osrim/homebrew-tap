class Ski < Formula
  desc "Skill manager for coding agents"
  homepage "https://github.com/osrim/ski"
  version "0.2.3"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/ski/releases/download/v0.2.3/ski-darwin-arm64.tar.gz"
      sha256 "03bb29a47f5ab31c1f75b0bbcf4c21fa9a64a0222022f87512360ff82238b376"
    else
      url "https://github.com/osrim/ski/releases/download/v0.2.3/ski-darwin-x64.tar.gz"
      sha256 "9c775d042eea6fd970ed6805ccd58bf234638bb20a7872b062929104cc7dfae6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/osrim/ski/releases/download/v0.2.3/ski-linux-arm64.tar.gz"
      sha256 "a87e36ecdf22f8d7a42c42884c8e3c08395cd73aac68d6621384af1aa049721d"
    else
      url "https://github.com/osrim/ski/releases/download/v0.2.3/ski-linux-x64.tar.gz"
      sha256 "ad695917f9c2c475545fc7102bdbc808f54c07d3bfc69c2e3008b0469f0f2b5e"
    end
  end

  def install
    bin.install "ski"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ski --version")
  end
end
