cask "sec-app" do
  version "0.2.1"
  sha256 "f8436ebc526c2cdd7c6707bc68c9e00c0db98aa60dd055c1595e3c48752bfcad"

  url "https://github.com/Kaidstor/sec/releases/download/app-v#{version}/sec-app_#{version}_darwin-aarch64.dmg"
  name "sec"
  desc "Desktop client for the sec secrets manager (search, copy via CLI, share links and packs)"
  homepage "https://github.com/Kaidstor/sec"

  livecheck do
    skip "Version and sha256 are bumped by the release script."
  end

  depends_on arch: :arm64
  depends_on cask: "sec"

  app "sec.app"

  zap trash: [
    "~/Library/Application Support/com.kaidstor.sec",
    "~/Library/Caches/com.kaidstor.sec",
    "~/Library/Preferences/com.kaidstor.sec.plist",
    "~/Library/Saved Application State/com.kaidstor.sec.savedState",
    "~/Library/WebKit/com.kaidstor.sec",
  ]
end
