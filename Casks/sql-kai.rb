cask "sql-kai" do
  version "1.20.0"
  sha256 "36c167b16bc49401c392791c8f96278638d7f90e607e61f04e86ff1f8118dd14"

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
