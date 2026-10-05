cask "tcp-kai" do
  version "1.5.1"
  sha256 "62ebfcfbd8815953129e8da0531b8507a9d1341b48adbc7cbccd55ce857cbea0"

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
