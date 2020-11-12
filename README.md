# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | unique: true|
| password | string | null: false |
| truename | string | null: false |
| birthday | string | null: false |

### Association

-has_many :items
-has_many :records

## items テーブル

| Column   | Type      | Options                       |
| -------- | --------- | ----------------------------- |
| name     | string    | null: false                   |
| image    | string    | null: false                   |
| text     | string    | null: false                   |
| category | text      | null: false                   |
| condition| string    | null: false                   |
| burden   | string    | null: false                   |
| region   | string    | null: false                   |
| day      | string    | null: false                   |
| price    | string    | null: false                   |
| user     |references | null: false, foreign_key: true|

### Association

-belongs_to :user
-has_one :record

## records テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-belongs_to :address

## addresses テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postalcode      | string     | null: false                    |
| prefecture      | string     | null: false                    |
| municipality    | string     | null: false                    |
| housenumber     | string     | null: false                    |
| phonenumber     | string     | null: false                    |

### Association

-belongs_to :record
