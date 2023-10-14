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

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| name_reading        | string     | null: false                    |
| postal_number       | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | integer    | null: false                    |
| fax_number          | integer    | null: true                     |
| sex_id              | integer    | null: true                     |
| relationship_id     | integer    | null: true                     |
| primary_care        | string     | null: true                     |
| emergency_contact   | string     | null: true                     |
| role                | integer    | null: false, default: 0        |

### Association
- has_many :notices
- has_many :photos
- has_many :events


## noticesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| notice_text      | text       | null: false                    |
| facility         | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## photosテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| photo_text       | text       | null: false                    |
| facility         | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## eventsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| event_year       | integer    | null: false                    |
| event_month      | integer    | null: false                    |
| event_day        | integer    | null: false                    |
| event_name       | string     | null: false                    |
| facility         | references | null: false, foreign_key: true |

### Association
- belongs_to :user