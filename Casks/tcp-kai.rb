cask "tcp-kai" do
  version "1.4.2"
  sha256 "6e1b6ec9de6687cbcaaa2fa9c6a5ba44c025e54b3c34a6a387617f72f9d90c2f"

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

  # разложить/догнать копии агентского скилла (~/.claude, ~/.codex) сразу при
  # install/upgrade, не дожидаясь первого send; симлинки (dev) не трогает
  postflight do
    system_command "#{appdir}/tcp-kai.app/Contents/MacOS/tcp-kai-cli",
                   args: ["skills", "install"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/com.kaidstor.app",
    "~/Library/Caches/com.kaidstor.app",
    "~/Library/Preferences/com.kaidstor.app.plist",
    "~/Library/Saved Application State/com.kaidstor.app.savedState",
    "~/Library/WebKit/com.kaidstor.app",
  ]
end
