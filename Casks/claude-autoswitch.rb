cask "claude-autoswitch" do
  version "0.2.0"
  sha256 "f90c08076ae2679f8a8fe42d1581da91c445afcb9928efe6510fab292875808b"

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
