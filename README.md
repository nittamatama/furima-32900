# users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |
| birthday           | date   | null: false               |

# Association

- has_many :purchases
- has_many :products


## purchases テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | -----------                    |
| product       | references    | null: false, foreign_key: true |
| user          | references    | null: false, foreign_key:true  |

## Association

- has_one :address
  belongs_to :user
  belongs_to :product



### products テーブル

| Column             | Type        | Options                       |
| ------------------ | ----------  | ------------------------------|
| product_name       | string      | null: false                   |
| description        | text        | null: false                   |
| selling_price      | integer     | null: false                   |
| user               | references  | null: false, foreign_key:true |
| category_id        | integer     | null: false                   |
| condition_id       | integer     | null: false                   |
| delivery_fee_id    | integer     | null: false                   |
| prefecture_id      | integer     | null: false                   |
| delivery_period_id | integer     | null: false                   |

### Association

- belongs_to :user
- has_one :purchase


#### addresses テーブル
| Column        | Type          | Options                        |
| postal_code   | string        | null: false                    |
| city          | string        | null: false                    |
| address       | string        | null: false                    | 
| building_name | string        |                                |
| prefecture_id | integer       | null: false                    |
| phone_number  | string        | null: false                    |
| purchase      | references    | null: false, foreign_key: true |

#### Association

belongs_to :purchase