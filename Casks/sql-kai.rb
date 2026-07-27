cask "sql-kai" do
  version "1.24.0"
  sha256 "2e655c42c80bfd8948670ee0603908b8e5e291a32c3a564cd9fb44b3bca876d3"

  url "https://github.com/Kaidstor/sql-kai/releases/download/v#{version}/sql-kai_#{version}_darwin-aarch64.dmg"
  name "sql-kai"
  desc "Desktop Postgres client with SSH tunnels, encrypted vault and a CLI twin for AI agents"
  homepage "https://github.com/Kaidstor/sql-kai"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64

  app "sql-kai.app"
  binary "#{appdir}/sql-kai.app/Contents/MacOS/sql-kai-cli", target: "sql-kai"

  zap trash: [
    "~/Library/Application Support/sql-kai",
    "~/Library/Caches/com.kaidstor.sql-kai",
    "~/Library/Preferences/com.kaidstor.sql-kai.plist",
    "~/Library/Saved Application State/com.kaidstor.sql-kai.savedState",
    "~/Library/WebKit/com.kaidstor.sql-kai",
  ]
end
