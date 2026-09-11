cask "cleanpulse" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0-alpha.4"
  sha256 arm:   "REPLACE_WITH_AARCH64_TAR_GZ_SHA256",
         intel: "REPLACE_WITH_X64_TAR_GZ_SHA256"

  url "https://github.com/bimlesharma/cleanpulse-releases/releases/download/v#{version}/CleanPulse_#{version}_#{arch}.tar.gz"
  name "CleanPulse"
  desc "Local-first macOS developer storage cleaner"
  homepage "https://cleanpulse.bimlesh.dev"

  depends_on macos: ">= :sonoma"

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
