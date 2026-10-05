cask "sec-app" do
  version "1.3.1"
  sha256 "8795e5acb072327fe0b4585aea77d83bb8ce8a2059d71cf452465750e77dd491"

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
