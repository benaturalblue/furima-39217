# README
# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | -------| --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| kana-name          | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :records
- has_many :addresses

## itemsテーブル

| Column    |Type        | Options                        |
| --------- |------------| ------------------------------ |
| title     | string     | null: false                    |
| content   | string     | null: false                    |
| category  | string     | null: false                    |
| condition | string     | null: false                    |
| charge    | string     | null: false                    |
| area      | string     | null: false                    |
| day       | string     | null: false                    |
| price     | integer    | null: false                    | 
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :addresses
- has_one :records

## recordsテーブル

| Column | Type        | Options           |
| -------| ----------- | ----------------- |
| user   | references  | foreign_key: true | 
| item   | references  | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addressesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal-code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| house-number | integer    | null: false                    |
| building     | string     |                                |
| phone-number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :records
- belongs_to :items