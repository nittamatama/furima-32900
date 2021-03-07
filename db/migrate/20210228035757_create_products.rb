class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description, null: false
      t.integer :selling_price, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_period_id, null: false
      t.timestamps
    end
  end
end
