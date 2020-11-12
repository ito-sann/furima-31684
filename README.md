# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true|
| encrypted_password | string | null: false |
| kanji_sei_name     | string | null: false |
| kanji_mei_name     | string | null: false |
| katakana_sei_name  | string | null: false |
| katakana_mei_name  | string | null: false |
| birthday           | date   | null: false |

### Association

-has_many :items
-has_many :records

## items テーブル

| Column      | Type      | Options                       |
| ----------- | --------- | ----------------------------- |
| name        | string    | null: false                   |
| text        | text      | null: false                   |
| category_id | integer   | null: false                   |
| condition_id| integer   | null: false                   |
| burden_id   | integer   | null: false                   |
| region_id   | integer   | null: false                   |
| day_id      | integer   | null: false                   |
| price       | integer   | null: false                   |
| user        |references | null: false, foreign_key: true|

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
-has_one :address

## addresses テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| region_id       | integer    | null: false                    |
| municipality    | string     | null: false                    |
| house_number    | string     | null: false                    |
| phone_number    | string     | null: false                    |
| building_number | string     |                                |
| record          | references | null: false, foreign_key: true |

### Association

-belongs_to :record
