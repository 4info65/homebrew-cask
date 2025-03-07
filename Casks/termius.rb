cask "termius" do
  arch arm: "mac-arm64", intel: "mac"

  version "7.49.0"
  sha256 :no_check

  url "https://autoupdate.termius.com/#{arch}/Termius.dmg"
  name "Termius"
  desc "SSH client"
  homepage "https://www.termius.com/"

  livecheck do
    url "https://autoupdate.termius.com/mac/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: ">= :el_capitan"

  app "Termius.app"

  uninstall delete: "/Library/Preferences/com.termius-dmg.mac.plist"

  zap trash: [
    "~/.termius",
    "~/Library/Application Support/Termius",
    "~/Library/Logs/Termius",
    "~/Library/Saved Application State/com.termius-dmg.mac.savedState",
  ]
end
