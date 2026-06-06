cask "yafw" do
  version "0.7"
  sha256 "c29f16419f24721e229bb01355a2700e5b069f19a142e019dff4b548f3d1096e"

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
