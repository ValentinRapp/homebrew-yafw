cask "yafw" do
  version "0.4"
  sha256 "cd39d779368e95dea76390215e3b64218edc137eb7f855410a5c5d6ec9983202"

  url "https://github.com/ValentinRapp/yafw/releases/download/v#{version}/stable-macos-arm64-yafw.dmg"
  name "Yafw"
  desc "Yet Another Frame Widget"
  homepage "https://github.com/ValentinRapp/yafw"

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
