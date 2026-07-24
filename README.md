# Kaidstor's Homebrew tap

```bash
brew install --no-quarantine kaidstor/tap/sql-kai
```

| Cask | Description |
| --- | --- |
| [`sql-kai`](Casks/sql-kai.rb) | [Desktop Postgres client](https://github.com/Kaidstor/sql-kai) with SSH tunnels, encrypted vault and a CLI twin for AI agents |
| [`sec`](Casks/sec.rb) | [Local secrets manager](https://github.com/Kaidstor/sec) CLI (managed by GoReleaser) |
| [`tcp-client`](Casks/tcp-client) | Legacy TCP client on Tauri |

`--no-quarantine` is recommended for the GUI apps: they are signed with a
development certificate and not notarized, so Gatekeeper would block the first
launch otherwise. Once installed, the apps keep themselves up to date via
their built-in updater.
