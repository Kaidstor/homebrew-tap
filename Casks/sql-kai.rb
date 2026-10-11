cask "sql-kai" do
  version "1.33.0"
  sha256 "75c599d8fc01b7228942ec9a6ab9ef549b80d387cde2947f9f90401686eb1133"

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
