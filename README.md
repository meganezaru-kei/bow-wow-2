# Bow Wow Album
犬の画像投稿アプリです。<br>
日々の成長記録等をアップして、ペットとの思い出を記録できます。<br>
レスポンシブ対応しているのでスマホからもご確認いただけます。
[![Image from Gyazo](https://i.gyazo.com/0b9367be4894657df429f79ec8596094.png)](https://gyazo.com/0b9367be4894657df429f79ec8596094)

# URL
https://bow-wow-album.com/ <br>
非ログイン状態の場合は記事の閲覧のみ可能です。ログインすると記事投稿やコメントが可能になります。<br>
ログイン画面の「かんたんログイン」をクリックすると、メールアドレスとパスワードを入力せずにログインできます。

# 言語・使用技術
#### フロント
- Haml
- Scss
- jQuery
- bootstrap4

#### バックエンド
- Ruby 2.5.1
- Ruby on Rails 5.2.3

#### サーバー
- Nginx 1.16.1

#### DB
- MySQL 5.7

#### インフラ・開発環境等
- Docker/docker-compose
- AWS（VPC, EC2, S3, Route 53, ALB, ACM）
- CircleCI（CI/CD)
- Capistrano3
- RSpec

#### AWS構成図
[![Image from Gyazo](https://i.gyazo.com/d589ba69eebf082b5ca05d36ef19b41e.png)](https://gyazo.com/d589ba69eebf082b5ca05d36ef19b41e)

# 実装機能
- ユーザー機能
  - deviseを使用
  - 新規登録・ログイン・ログアウト機能
  - マイページ・登録情報編集機能
- 記事投稿機能
- 画像投稿機能
  - active_storageを使用
  - 複数枚投稿可
- 画像スライド表示機能
- カテゴリ機能
  - ancestryを使った階層構造
- タグ機能
- コメント機能
- 検索機能
  - ransackを使用
- ページネーション機能
