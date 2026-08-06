cask "tcp-kai" do
  version "1.3.4"
  sha256 "fa919a2cff24184344d2af93a2dd494bbc62dde5ae8f5595af66e3322b9f4ba7"

  url "https://github.com/Kaidstor/tcp-kai/releases/download/v#{version}/tcp-kai_#{version}_darwin-aarch64.dmg"
  name "tcp-kai"
  desc "Desktop client for NestJS TCP microservices with a CLI twin for AI agents"
  homepage "https://github.com/Kaidstor/tcp-kai"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64

  app "tcp-kai.app"
  binary "#{appdir}/tcp-kai.app/Contents/MacOS/tcp-kai-cli", target: "tcp-kai"

  zap trash: [
    "~/Library/Application Support/com.kaidstor.app",
    "~/Library/Caches/com.kaidstor.app",
    "~/Library/Preferences/com.kaidstor.app.plist",
    "~/Library/Saved Application State/com.kaidstor.app.savedState",
    "~/Library/WebKit/com.kaidstor.app",
  ]
end
