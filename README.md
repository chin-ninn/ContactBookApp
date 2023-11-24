# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## アプリケーション名

高齢者施設用の連絡帳アプリ


## アプリケーション概要

高齢者施設と利用者本人及びその家族間の連絡等を密接にできるアプリ。
保育園等で使用されている連絡帳アプリを高齢者施設用に変更したもの。


## 利用方法

日々の記録機能：
　利用日のバイタル、利用時の様子、入浴や排便の有無などを投稿し、一覧で見ることができる。
お知らせ投稿機能：
　書類の配布や営業に関わる連絡など重要なものを投稿し、ホーム画面に一覧表示する。
写真投稿機能：
　施設での様子を写した写真をコメント付きで簡単に投稿できる。
カレンダー機能：
　施設での行事予定を月ごとに見ることができる。


## アプリケーションを作成した背景

多くの施設が使用している手帳は在庫管理、紛失時の対応、代金の利用者負担など手間がかかることがある。
施設と利用者及びその家族への連絡や相互のやり取りを簡単にしたい。
スマホ等で簡単に操作できることで、特に利用者の子供世代とのやり取りがより簡便化できる。
手帳の代金が無くなることで利用者の負担が減り、施設側の在庫管理における手間を減すことができる。
独居高齢者や高齢夫婦などインターネットの恩恵を受けにくい方々への対応は検討する必要がある。


## 開発環境	

使用した言語：Ruby on Rails, HTML/CSS, JavaScript


## 工夫したポイント

・deviseでadmin（施設）とuser（利用者及びその家族）とでモデルを分け、それぞれに必要な登録情報を取得する。
・パソコンやスマホに慣れていない方でも分かりやすいように、表示内容は出来るだけ簡略化する。
・外部の方（ケアマネジャーや施設を検討している方等）に施設の中身が見れるように、写真やカレンダーを見れるようにする。



## usersテーブル

| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false               |
| name                | string     | null: false               |
| name_reading        | string     | null: false               |
| postal_code         | string     | null: false               |
| prefecture_id       | integer    | null: false               |
| city                | string     | null: false               |
| house_number        | string     | null: false               |
| building_name       | string     |                           |
| phone_number        | integer    | null: false               |
| fax_number          | integer    |                           |

### Association
- has_many :notices
- has_many :photos
- has_many :events


## noticesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| notice_title     | string     | null: false                    |
| notice_text      | text       | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## photosテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| photo_text       | text       | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## calendarsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| event            | string     | null: false                    |
| start_time       | datetime   | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user