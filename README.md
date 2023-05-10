# README
# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | -------| --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :records

## itemsテーブル

| Column       | Type       | Options                        |
| ---------    |------------| ------------------------------ |
| title        | string     | null: false                    |
| content      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| charge_id    | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| day_id       | integer    | null: false                    |
| price        | integer    | null: false                    | 
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## recordsテーブル

| Column | Type        | Options           |
| -------| ----------- | ----------------- |
| user   | references  | foreign_key: true | 
| item   | references  | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addressesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal-code  | string     | null: false                    |
| area_id      | integer    | null: false                    |
| city         | string     | null: false                    |
| house-number | string     | null: false                    |
| building     | string     |                                |
| phone-number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :record
- belongs_to :item