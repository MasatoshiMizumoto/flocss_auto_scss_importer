- [FLOCSS auto scss importer](#flocss-auto-scss-importer)
  - [概要](#概要)
  - [使い方](#使い方)
  - [その他](#その他)

# FLOCSS auto scss importer

## 概要

- FLOCSS に準拠するにはベースとなる SCSS ファイル(style.scss など)に、分割した SCSS ファイルのインポート定義が必要です。
- このスクリプトでは各 FLOCSS レイヤーディレクトリのファイルをチェックし、`@use`または`@import`文を含む style.scss を生成します。
- SCSS の自動インポートには Gulp が適していましたが Sass 側で非推奨になった為、glob に変わる処理をスクリプトで作りました。
- 尚、各レイヤーディレクトリには SCSS ファイルしかない想定なので、違う種別のファイルがあっても無視しません。適宜コメントするか削除してください。

## 使い方

- 配布しているスクリプトを clone でもなんでも良いので`start-import.sh`として入手してください。
  - ワークスペース外のディレクトリに配置しておき、呼び出しは VSCode のタスク機能に入れると良いでしょう。
- コマンドの使い方は下記の通りです。

```bash
bash(またはsh) start-import.sh $1 $2
```

- 引数($n)の役割は以下の通りです。いずれも必須です。
  - `$1` = FLOCSS 構造(foundation, etc...)を持つディレクトリの親
  - `$2` = `@use` または `@import`

- 例えば、スクリプト及び関係ファイルが下記のように配置されていて、`@use`で生成したい場合は、「`bash start-import.sh ./scss @use`」になります。

```
.(VSCodeのワークスペース)
├── start-import.sh(本スクリプト)
└── scss
    ├── foundation
    ├── layout
    └── object
        ├── component
        ├── project
        └── utility
```

## その他

- Foundation は FLOCSS 考案者の定義しているファイルに固定しています。
  - 変更したい場合は Layer1 の部分のヒアドキュメント(`EOF`で囲まれている部分)を書き替えて下さい。
- 対象レイヤーは固定になっていますが、スクリプトを直接編集することで処理対象レイヤーをカスタマイズできます。
  - Layer 毎にどの処理かコメントを入れてありますので、複製して処理を確認してみてください。

以上
