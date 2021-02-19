## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| first_name| string | null: false |
| last_name | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| nickname  | string | null: false |
| first_kana | string | null: false |
| last_kana | string | null: false |
## purchase テーブル

| Column        | Type          | Options     |
| ------        | ------        | ----------- |
| postal_code   | string        | null: false |
| city          | string        | null: false |
| address       | string        | null: false |
| building_name | string        |             |
| phone_number  | string        | null: false |
| user          | references    | null: false, foreign_key:true |

## products テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| description   | text       | null: false                    |
| selling_price | string     | null: false                    |
| user          | references | null: false, foreign_key:true  |
