cask "sec-app" do
  version "1.4.2"
  sha256 "f4bc156687f385f5f49303a74fa6038dc6df71c0e35e80809012b5accc048e12"

  url "https://github.com/Kaidstor/sec/releases/download/app-v#{version}/sec-app_#{version}_darwin-aarch64.dmg"
  name "sec"
  desc "Desktop client for the sec secrets manager: search, copy and share links"
  homepage "https://github.com/Kaidstor/sec"

  livecheck do
    skip "Version and sha256 are bumped by the release script."
  end

  depends_on arch: :arm64
  depends_on cask: "sec"
  depends_on :macos

  app "sec.app"

  zap trash: [
    "~/Library/Application Support/com.kaidstor.sec",
    "~/Library/Caches/com.kaidstor.sec",
    "~/Library/Preferences/com.kaidstor.sec.plist",
    "~/Library/Saved Application State/com.kaidstor.sec.savedState",
    "~/Library/WebKit/com.kaidstor.sec",
  ]
end
