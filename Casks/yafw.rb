cask "yafw" do
  version "0.7.4"
  sha256 "9c62577efbcdb1d1c030889b0052e16e54fa605349d37a905f6e35ac87780866"

  url "https://github.com/ValentinRapp/yafw/releases/download/v#{version}/stable-macos-arm64-yafw.dmg"
  name "Yafw"
  desc "Yet Another FFmpeg Wrapper"
  homepage "https://github.com/ValentinRapp/yafw"

  depends_on arch: :arm64
  depends_on formula: "ffmpeg"

  app "yafw.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/yafw.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/yafw",
    "~/Library/Preferences/yafw.electrobun.dev.plist",
  ]
end
