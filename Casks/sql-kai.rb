cask "sql-kai" do
  version "1.26.0"
  sha256 "6b75b4de3ac9765fc1d4ca25fe02d39ab0be72363c20fa1fd9a38e0288c81ea4"

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
