cask "sql-kai" do
  version "1.33.2"
  sha256 "1d237b46e76cb4d2cdc48ecc817635a07aea8f6b33db093c506f253fe0a368f8"

  url "https://github.com/Kaidstor/sql-kai/releases/download/v#{version}/sql-kai_#{version}_darwin-aarch64.dmg"
  name "sql-kai"
  desc "Postgres client with SSH tunnels, encrypted vault and a CLI for AI agents"
  homepage "https://github.com/Kaidstor/sql-kai"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "sql-kai.app"
  binary "#{appdir}/sql-kai.app/Contents/MacOS/sql-kai-cli", target: "sql-kai"

  postflight_steps do
    run "{{appdir}}/sql-kai.app/Contents/MacOS/sql-kai-cli",
        args:           ["skills", "install"],
        env:            { "HOME" => "/Users/{{user}}" },
        must_succeed:   false,
        print_stdout:   true,
        writable_paths: [".claude/skills", ".codex/skills"],
        writable_base:  :home
  end

  zap trash: [
    "~/Library/Application Support/sql-kai",
    "~/Library/Caches/com.kaidstor.sql-kai",
    "~/Library/Preferences/com.kaidstor.sql-kai.plist",
    "~/Library/Saved Application State/com.kaidstor.sql-kai.savedState",
    "~/Library/WebKit/com.kaidstor.sql-kai",
  ]
end
