## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| first_name| string | null: false |
| last_name | string | null: false |
| email     | string | null: false, unique |
| encrypted_password  | string | null: false |
| nickname  | string | null: false |
| first_kana | string | null: false |
| last_kana | string | null: false |
| birthday  | date   | null: false |

### Association

- has_many :purchase
- has_many :products


## purchase テーブル

| Column        | Type          | Options     |
| ------        | ------        | ----------- |
| postal_code   | string        | null: false |
| city          | string        | null: false |
| address       | string        | null: false |
| building_name | string        |             |
| phone_number  | string        | null: false |
| user          | references    | null: false, foreign_key:true |
| prefecture    | integer       | null: false |

### Association

- has_many :users
- belongs_to :products

## products テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| description   | text       | null: false                    |
| selling_price | string     | null: false                    |
| user          | references | null: false, foreign_key:true  |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| delivery_area | integer    | null: false                    |
| delivery_period| integer   | null: false                    |

### Association

- belongs_to :users
- has_one :purchase
