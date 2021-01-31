# アプリケーション名
BabyLog

# アプリケーション概要
子供の成長を家族や親族間などで見守れる、写真共有アプリです。

# URL
https://babylog-32573.herokuapp.com/
# テスト用アカウント
・メールアドレス： aaa@aaa  
・パスワード： aaa111
# 利用方法
・WebブラウザGoogleChromeの最新版を利用してアクセスしてください。  
　＊ただし、デプロイ等で接続できないタイミングをもざいます。その際は少しお時間をおいてから接続してください。  
・接続先、ログイン情報は上記の通りです。  
・同時に複数の方がログインしている場合に、ログインできない可能性がございます。  
・テストアカウントでログイン → トップページからから「アルバムを作る」を押下 → 情報を入力、「アルバムを作成する」押下 → ルームが作成されます。  
・作成したアルバムの写真又は、アルバム名を押下 → 投稿一覧ページから「写真を投稿する」を押下 → 写真が投稿されます。  
・投稿した写真を押下 → 詳細画面からコメントを入力し、コメントするを押下 → コメントが投稿されます。  

# 目指した課題解決
・コロナ禍で子供を両親や、親族に合わせづらいが子供の成長を見て欲しい、又は見たい。  
　→**Webアプリケーション上で写真を投稿し共有できる。（子供は0〜1歳向け）**  
・誰の写真なのか写真なのかわかりづらい、観覧できるユーザーを（家族や親族などに）特定したい。  
　→**人物ごとのルームに分けて、そのルームに入れるユーザーを指定できる**  

# 実装機能についてのGIFと説明
![users]()
## ユーザー管理機能

# 実装予定の機能





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
| room_id       | integer    | null: false                    |
| image         |            | (ActiveStorage)                |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :posts
- has_many :comments
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

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| room          | references | null: false, foreign_key: true |
| event_id      | integer    | null: false, foreign_key: true |
| user _id      | integer    | null: false                    |
| shooting_date | date       | null: false, foreign_key: true |
| image         |            | (ActiveStorage)                |

### Association

- belongs_to :user
- belongs_to :room
- has_many :comments

## comments テーブル

| Column              | Type           | Options                        |
| ------------------- | -------------- | ------------------------------ |
| content             | string         | null: false                    |
| post                | references     | null: false, foreign_key: true |
| user                | references     | null: false, foreign_key: true |
| room                | references     | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :post
- belongs_to :room

## relationships テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user_id             | string     | null: false                    |
| relationship_id     | integer    | null: false                    |


### Association

- belongs_to :room
