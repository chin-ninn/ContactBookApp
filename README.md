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

高齢者施設からの連絡アプリ


## アプリケーション概要

高齢者施設からの連絡事項やイベント時の様子を登録者に共有できるアプリ。


## 利用方法

お知らせ投稿機能：
　書類の配布や営業に関わる連絡など重要なものを投稿し、ホーム画面に一覧表示する。
写真投稿機能：
　施設での様子を写した写真をコメント付きで簡単に投稿できる。
カレンダー機能：
　施設での行事予定を月ごとに見ることができる。


## アプリケーションを作成した背景

施設内での様子を知りたい家族に向けて写真やイベントのお知らせを一括で操作したい。
同居していなくても登録していれば閲覧することができる。
ホームページ等を作成しなくても写真やコメントを投稿することができる。


## 開発環境	

使用した言語：Ruby on Rails, HTML/CSS, JavaScript


## 工夫したポイント

・パソコンやスマホに慣れていない方でも分かりやすいように、表示内容は出来るだけ簡略化する。



## adminsテーブル

| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false               |
| fac_name            | string     | null: false               |
| postal_code         | string     | null: false               |
| prefecture_id       | integer    | null: false               |
| city                | string     | null: false               |
| house_number        | string     | null: false               |
| building_name       | string     |                           |
| phone_number        | integer    | null: false               |
| fax_number          | integer    |                           |

### Association
- has_many :users
- has_many :notices
- has_many :photos
- has_many :events


## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| name                | string     | null: false                    |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | integer    | null: false                    |
| fax_number          | integer    |                                |
| admin               | references | null: false, foreign_key: true |

### Association
- belongs_to :admin


## noticesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| notice_title     | string     | null: false                    |
| notice_text      | text       | null: false                    |
| admin            | references | null: false, foreign_key: true |

### Association
- belongs_to :admin


## photosテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| photo_text       | text       | null: false                    |
| admin            | references | null: false, foreign_key: true |

### Association
- belongs_to :admin


## calendarsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| event            | string     | null: false                    |
| start_time       | datetime   | null: false                    |
| admin            | references | null: false, foreign_key: true |

### Association
- belongs_to :admin