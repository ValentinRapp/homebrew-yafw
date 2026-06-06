cask "yafw" do
  version "0.7.2"
  sha256 "860a83946e34df6255e288d2a331096996d9947c75e45c5f629769293f4b76e9"

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
