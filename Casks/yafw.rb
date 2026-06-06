cask "yafw" do
  version "0.7.1"
  sha256 "5e6e38f9fbd2096e7344a9021ba332d916089b8a32b18f85cf3c9a6eeb043380"

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
