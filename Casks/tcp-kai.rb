cask "tcp-kai" do
  version "1.5.3"
  sha256 "ed9c5231ec432756c94e55c5a5f2968886257a31b60bfdfbfd2a41983bc05319"

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
  depends_on :macos

  app "tcp-kai.app"
  binary "#{appdir}/tcp-kai.app/Contents/MacOS/tcp-kai-cli", target: "tcp-kai"

  # разложить/догнать копии агентского скилла (~/.claude, ~/.codex) сразу при
  # install/upgrade, не дожидаясь первого send; симлинки (dev) не трогает
  postflight_steps do
    run "{{appdir}}/tcp-kai.app/Contents/MacOS/tcp-kai-cli",
        args:           ["skills", "install"],
        env:            { "HOME" => "/Users/{{user}}" },
        must_succeed:   false,
        print_stdout:   true,
        writable_paths: [".claude/skills", ".codex/skills"],
        writable_base:  :home
  end

  zap trash: [
    "~/Library/Application Support/com.kaidstor.app",
    "~/Library/Caches/com.kaidstor.app",
    "~/Library/Preferences/com.kaidstor.app.plist",
    "~/Library/Saved Application State/com.kaidstor.app.savedState",
    "~/Library/WebKit/com.kaidstor.app",
  ]
end
