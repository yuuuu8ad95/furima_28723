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


# テーブル設計


## usersテーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| first_name       | string   | null: false |
| family_name      | string   | null: false |
| first_name_kana  | string   | null: false |
| family_name_kana | string   | null: false |
| birthday         | date     | null: false |

### Association
- has_many :items
- has_one :purchase



## destinationsテーブル
 
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| postal_code         | string     | null: false                   |
| prefecture_id       | integer    | null: false                   |
| city                | string     | null: false                   |
| address             | string     | null: false                   |
| building_name       | string     |                               |
| phone_name          | string     | null: false                   |
| purchase            | references |foreign_key: true              |

### Association
- belongs_to :purchase




## purchasesテーブル

| Column  | Type       | Options                       |
| --------| ---------- | ------------------------------|
| user    | references | foreign_key: true             |
| item    | references | foreign_key: true             |

### Association
- has_one :destination
- belongs_to :user
- belongs_to :item





## itemsテーブル

| Column       | Type       | Options                       |
| ------------ | --------   | ----------------------------- |
| image        | string     | null: false                   |
| name         | string     | null: false                   |
| explain      | text       | null: false                   |
| category_id  | integer    | null: false                   |
| status_id    | integer    | null: false                   |
| cost_id      | integer    | null: false                   |
| from_id      | integer    | null: false                   |
| day_id       | integer    | null: false                   |
| price        | integer    | null: false                   |
| user         | references | foreign_key :true             |

### Association
- belongs_to :user
- has_one :purchase
