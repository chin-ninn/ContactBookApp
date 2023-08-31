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

## usersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| facility_name   | string     | null: false                    |
| postal_number   | string     | null: false                    |
| address         | string     | null: false                    |
| phone_number    | integer    | null: false                    |
| fax_number      | integer    | null: false                    |
| mail_address    | string     |                                |

### Association
- has_many :notices
- has_many :photos


## noticesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
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