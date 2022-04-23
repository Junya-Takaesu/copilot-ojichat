# Copilot による ojichat 実行

## 実行の仕方
### 1. アプリの作成

```
perman-aws-vault exec copilot app init
```
- 作成される AWS リソース
  - CloudFormation スタック
    - リリースインフラを管理する IAM ロール
- 既存のアプリを使わない → create new application を行う
- `/copilot` ディレクトリが作成される
- このプロジェクトにはすでに `/copilot` がコミットされている
- が、構わず、app init する
  - → copilot cli がアプリが認識できるようにするため
- スクラッチでやると、空の `/copilot` ディレクトリができる？

### 2. env の作成
```
perman-aws-vault exec copilot env init
```
- 作成される AWS リソース
  - CloudFormation スタック
    - VPC
    - public subnet
    - private subnet
    - ecs cluster
- dev などの名前を env につける
- credential については `Enter temporary credentials` を選択

### 3. job の作成
```
perman-aws-vault exec copilot job init
```
- スクラッチでやると、定期実行間隔の設定とか聞かれる
- でも、`/copilot` ディレクトリ無いにあるサブディレクトリの名前を指定すると、そのサブディレクトリ内の manifest.yml を使える(tchat-jobが今ある)
- 定期実行する必要なければ、`job deproy` は不要

### 4. job を 単発の job として実行
```
perman-aws-vault exec \
copilot task run \
--follow \
--app takaesu-ojichat \
--env-vars "WEB_HOOK_URL=https://hooks.slack.com/services/xxxxxxxx/xxxxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```
- `WEB_HOOK_URL` は slack app の webhook url
  - すでに slack app が作成されていたら、以下のページから WEB_HOOK_URL をコピーできる
    - https://api.slack.com/
      - - 右上の `Your apps` から、作成したアプリの一覧が確認でき、どこからアプリの詳細を開くと、 webhook url が確認できる


### 5. 後片付け
```
perman-aws-vault exec copilot task delete
```
```
perman-aws-vault exec copilot job delete
```
```
perman-aws-vault exec copilot env delete
```
```
perman-aws-vault exec copilot app delete --name takaesu-ojichat
```