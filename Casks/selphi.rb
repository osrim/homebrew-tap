cask "selphi" do
  version "0.1.0"
  sha256 "6ab854c2486e21e2f6e50748d414d84bd7c28ebc696d268a5b0f8af21e99dfb1"

  url "https://github.com/osrim/selphi/releases/download/v#{version}/selphi-darwin-arm64.zip"
  name "selphi"
  desc "Prepare photos for borderless printing on a Canon SELPHY"
  homepage "https://github.com/osrim/selphi"

  depends_on arch: :arm64
  depends_on :macos

  app "selphi.app"
  binary "#{appdir}/selphi.app/Contents/MacOS/selphi"
  bash_completion "#{appdir}/selphi.app/Contents/Resources/completions/selphi.bash"
  zsh_completion "#{appdir}/selphi.app/Contents/Resources/completions/_selphi"
  fish_completion "#{appdir}/selphi.app/Contents/Resources/completions/selphi.fish"

  zap trash: [
    "~/.config/selphi",
    "~/Library/Saved Application State/io.github.osrim.selphi.savedState",
  ]

  caveats <<~EOS
    selphi.app is not notarized. macOS blocks the first launch.
    To allow it, open System Settings > Privacy & Security and click Open Anyway.
  EOS
end
