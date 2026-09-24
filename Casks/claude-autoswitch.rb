cask "claude-autoswitch" do
  version "0.4.1"
  sha256 "b2b205896a05e04a8026b6977b968fe3ffb2896d5df2d27857633db24fb78f7d"

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
