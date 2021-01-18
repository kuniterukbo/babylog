# アプリケーション名
BabyLog

# アプリケーション概要
子供の写真を家族、親族内で共有できることに特化した写真投稿アプリ。

# URL

# テスト用アカウント

# 利用方法

# 目指した課題解決
・LINEなどで写真を共有すると投稿数が多いとスクロールして確認したり、保存して自分でまとめないと見づらい。
・LINEでは機能が多くて使いづらい。
・文章のやりとりをメインとするツールで写真を投稿すると返信しないといけない雰囲気になる。気を遣う。
・月ごとや、イベントごとに写真を分けたい。

# 洗い出した要件
| 機能                | 目的       | 詳細                           | ストーリー(ユースケース)            |
| ------------------- | ---------- | ------------------------------ | ------------------------------ |
| ユーザー管理機能    | 誰の投稿、コメント、ルームなのか管理するため。   |・ユーザー情報を新しく登録できる。<br>・登録したらログインできる。<br>・ユーザー情報を編集できる<br>・ログアウトできる  |・ユーザー情報を正しく入力したらユーザー情報が保存され、ログイン状態になる。<br>・ログイン状態の時はログアウトできる。<br>・ユーザー登録後ユーザー情報を編集することができる。 |
| ルーム作成機能      | 特定のユーザーのみに観覧できるようにする    | ルームごとに写真が観覧できる。 | ・ルーム名をクリックするとそのルームに入れる。<br>・ルームに入らないと写真を観覧できない。 |
| 写真投稿機能        | 写真を観覧できるようにする | 写真を投稿、削除できる。 | ・ルーム内で写真を投稿することができる。<br>・投稿者は自分が投稿したのもに関して削除できる |
| コメント機能        | 各写真に対してコメント投稿できる   | コメントしたい写真をクリックしたらコメントできるようにする | ・コメントをしたらそのコメントの内容が表示される。<br>・コメントしたユーザーはその内容に関して削除、編集することができる |


# 実装機能についてのGIFと説明

# 実装予定の機能

# ER図

# ローカルでの動作方法




# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |


### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :posts
- has_many :comments
- has_one :relationships


## rooms テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| baby_name     | string     | null: false                    |
| gender_id     | integer    | null: false                    |
| birthday      | date       | null: false                    |
| image         |            | (ActiveStorage)                |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :posts
- has_many :relationship

## room_users テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| room          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room


## posts テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| room      | references | null: false, foreign_key: true |
| image     |            | (ActiveStorage)                |

### Association

- belongs_to :user
- belongs_to :room
- has_many :comments

## comments テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| content             | string     | null: false                    |
| post_id             | string     | null: false, foreign_key: true |
| user                | text       | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :post

## relationships テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user_id             | string     | null: false                    |
| relationship_id     | integer    | null: false                    |


### Association

- belongs_to :room
- has_many :comments
