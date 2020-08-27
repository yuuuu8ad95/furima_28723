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


#テーブル設計


##usersテーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| first_name       | string   | null: false |
| family_name      | string   | null: false |
| first_name_kana  | string   | null: false |
| family_name_kana | string   | null: false |
| birth_year       | data     | null: false |
| birth_month      | data     | null: false |
| birth_day        | data     | null: false |

###Association
- has_many :items
- has_one :profiles
- has_one :destinations



##destinationテーブル
 
| Column              | Type      | Options                       |
| ------------------- | --------- | ----------------------------- |
| postal_code         | string    | null: false                   |
| prefecture          | data      | null: false                   |
| city                | string    | null: false                   |
| address             | string    | null: false                   |
| building_name       | string    |                               |
| phone_name          | string    | null: false                   |
| user_id             | reference | null: false foreign_key: true |

###Association
- belongs_to :users





##purchaseテーブル

| Column  | Type      | Options                       |
| --------| --------  | ------------------------------|
| user_id | reference | null: false foreign_key: true |
| item_id | reference | null: false foreign_key: true |

###Association
- belongs_to :users




##itemsテーブル

| Column  | Type      | Options                 |
| --------| --------  | ------------------------|
| name    | string    | null: false             |
| image   | string    | null: false             |
| explain | string    | null: false             |
| status  | string    | null: false             |
| price   | string    | null: false             |
| cost    | string    | null: false             |
| days    | string    | null: false             |
| user_id | reference | null: false foreign_key |

###Association
- belongs_to :users
