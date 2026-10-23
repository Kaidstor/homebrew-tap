cask "vault-kai" do
  version "0.3.2"
  sha256 "ec4b5b2fdf084202ce4f6a85d6f3f06be0d20701faa0deb0dde4f157644ed88e"

  # Релизы лежат в корпоративном GitLab: ставится только из VPN, а сертификат
  # gitlab.rebrandy подписан внутренним CA, который должен быть в связке ключей
  # (если браузер открывает gitlab.rebrandy без предупреждения, он там есть).
  url "https://gitlab.rebrandy/tools/vault-kai/-/releases/v#{version}/downloads/vault-kai_#{version}_aarch64.dmg"
  name "vault-kai"
  desc "Desktop and CLI client for service env documents in the rebrandy Vault"
  homepage "https://gitlab.rebrandy/tools/vault-kai"

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "vault-kai.app"
  binary "#{appdir}/vault-kai.app/Contents/MacOS/vault-kai-cli", target: "vault-kai"

  zap trash: [
    "~/Library/Application Support/vault-kai",
    "~/Library/Caches/com.kaidstor.vault-kai",
    "~/Library/Preferences/com.kaidstor.vault-kai.plist",
    "~/Library/Saved Application State/com.kaidstor.vault-kai.savedState",
    "~/Library/WebKit/com.kaidstor.vault-kai",
  ]
end
