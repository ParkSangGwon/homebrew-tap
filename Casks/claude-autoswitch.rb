cask "claude-autoswitch" do
  version "0.1.2"
  sha256 "d8af28ea57308fa570cfa9c60b2fb7b3820c095bbf9b9e49564c459b6b6899de"

  url "https://github.com/ParkSangGwon/claude-account-autoswitch/releases/download/v#{version}/Claude-AutoSwitch-v#{version}.zip"
  name "Claude AutoSwitch"
  desc "Menu bar app that rotates Claude Code across several Claude accounts"
  homepage "https://github.com/ParkSangGwon/claude-account-autoswitch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Claude AutoSwitch.app"

  zap trash: [
    "~/Library/Application Support/Claude AutoSwitch",
    "~/Library/Preferences/com.parksanggwon.claudeautoswitch.plist",
  ]

  caveats <<~EOS
    Claude AutoSwitch is ad-hoc signed, not notarized. If macOS refuses to open it,
    allow it under System Settings → Privacy & Security → Open Anyway, or clear the flag:

      xattr -dr com.apple.quarantine "#{appdir}/Claude AutoSwitch.app"
  EOS
end
