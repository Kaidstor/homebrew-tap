cask "tcp-kai" do
  version "1.4.0"
  sha256 "39437e9b14c017d6013264d432c084c2c2ef21e777fc1849dbdd68a815f036b0"

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
