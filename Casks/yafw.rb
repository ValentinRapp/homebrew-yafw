cask "yafw" do
  version "0.7.3"
  sha256 "06ec4a29818e5e856c29aa33efad08e68fedd9be598d4076d85f33e79f33e15f"

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
