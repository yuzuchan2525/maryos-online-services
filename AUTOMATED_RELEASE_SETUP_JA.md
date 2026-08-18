# MARYOS 自動アップデート公開 — 初回セットアップ

`maryos-online-services` には `.github/workflows/publish-maryos-update.yml` が入っています。

初回設定が終われば、以後は GitHub の **Actions → Publish MARYOS Update → Run workflow** だけで、Windows版のビルドからR2公開、Workers側メタデータ更新まで自動で行えます。

## 1. MARYOS本体用のPrivate repositoryを1つ作る

推奨名:

`yuzuchan2525/maryos`

Visibility は **Private** にしてください。

ここにはElectron版MARYOSのソースを置きます。`package.json` と `forge.config.cjs` がrepository rootにあり、`npx electron-forge make --platform=win32 --arch=x64` が実行できる構成を想定しています。

## 2. Private source repo読み取り用token

GitHubのFine-grained personal access tokenを作成し、対象repositoryを `maryos` のみに限定してください。

必要権限はソースをcheckoutできる最小権限（Contents: Read）にします。

`maryos-online-services` の

Settings → Secrets and variables → Actions → Repository secrets

へ移動し、次の名前で保存します。

`MARYOS_SOURCE_TOKEN`

## 3. Cloudflare R2用secret

同じRepository secretsへ以下を登録します。

`CLOUDFLARE_API_TOKEN`

`CLOUDFLARE_ACCOUNT_ID`

Cloudflare API tokenは `maryos-updates` R2 bucketへオブジェクトを書き込める最小権限にしてください。

現在のR2 bucket:

`maryos-updates`

Public feed:

`https://pub-9e098a93cbe24c8aa80191adf4ec99e2.r2.dev`

## 4. 以後の公開方法

MARYOS本体のPrivate repositoryで更新をcommit/pushします。

`package.json` のversionも新しい値へ変更してください。例:

- RC9: `1.0.9`
- 次版: `1.0.10`

その後 `maryos-online-services` を開きます。

Actions → Publish MARYOS Update → Run workflow

通常は入力を変更せず実行できます。

- source_repo: `yuzuchan2525/maryos`
- source_ref: `main`

## 自動で行われる処理

1. Private MARYOS sourceをcheckout
2. Windows runnerで依存関係をinstall
3. Electron Forge / Squirrel.Windowsでbuild
4. `RELEASES`, `*-full.nupkg`, `*-Setup.exe` を収集
5. Cloudflare R2 `maryos-updates` にupload
6. RC8互換のWorkers `RELEASES` bridgeを生成
7. `native-update.json` を新versionへ更新
8. `maryos-online-services` のmainへ自動commit/push
9. GitHub連携Cloudflare deploymentが新しいWorkers metadataを公開

## セキュリティ

- Cloudflare API tokenやGitHub tokenをsource codeへ書かないでください。
- tokenはRepository secretsにのみ保存します。
- Private source tokenはMARYOS source repoへの読み取りだけに限定してください。
- R2 tokenも必要なbucketへの書き込みだけに限定するのを推奨します。
