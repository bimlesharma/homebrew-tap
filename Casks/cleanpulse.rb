cask "cleanpulse" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0-alpha.4"
  sha256 arm:   "501467a54a4a2268d9d1aac5856cfb7c730c5f4930428ea50f8c3d11c85349f0",
         intel: "cd9f5e99e8d0594bfee5773c958aea8b60c5fca94a49807443cdb6c2fa4099b8"

  url "https://github.com/bimlesharma/cleanpulse-releases/releases/download/v#{version}/CleanPulse_#{version}_#{arch}.tar.gz"
  name "CleanPulse"
  desc "Local-first macOS developer storage cleaner"
  homepage "https://cleanpulse.bimlesh.dev"

  depends_on macos: :sonoma

  app "CleanPulse.app"

  # postflight is Homebrew internal API; keep isolated for easy replacement.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CleanPulse.app"]
  end

  caveats <<~EOS
    CleanPulse alpha builds are ad-hoc signed and are not Apple-notarized.
  EOS
end
