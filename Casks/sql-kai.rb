cask "sql-kai" do
  version "1.20.1"
  sha256 "95815e23f33bab4ab2b867f1ce27f76a5c8a7b662c03570e9e6633ca0dff0c87"

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

  caveats <<~EOS
    sql-kai is signed with a development certificate and not notarized by Apple.
    Install with --no-quarantine so Gatekeeper does not block the first launch:

      brew install --no-quarantine kaidstor/tap/sql-kai

    If it is already installed and blocked, clear the quarantine flag:

      xattr -dr com.apple.quarantine /Applications/sql-kai.app
  EOS

  zap trash: [
    "~/Library/Application Support/sql-kai",
    "~/Library/Caches/com.kaidstor.sql-kai",
    "~/Library/Preferences/com.kaidstor.sql-kai.plist",
    "~/Library/Saved Application State/com.kaidstor.sql-kai.savedState",
    "~/Library/WebKit/com.kaidstor.sql-kai",
  ]
end
